//
//  ADRecorder.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//

import AVFoundation

final class Recorder: ObservableObject {
    enum RecordingState {
    case recording, paused, stopped
    }
  
    private var engine: AVAudioEngine!
    private var mixerNode: AVAudioMixerNode!
    private var state: RecordingState = .stopped
    
    var converter: AVAudioConverter!
    var compressedBuffer: AVAudioCompressedBuffer?
  
    init() {
        setupSession()
        setupEngine()
    }
    
    func startRecording() throws {
      let tapNode: AVAudioNode = mixerNode
      let format = tapNode.outputFormat(forBus: 0)

      var outDesc = AudioStreamBasicDescription()
      outDesc.mSampleRate = format.sampleRate
      outDesc.mChannelsPerFrame = 1
      outDesc.mFormatID = kAudioFormatFLAC

      let framesPerPacket: UInt32 = 1152
      outDesc.mFramesPerPacket = framesPerPacket
      outDesc.mBitsPerChannel = 24
      outDesc.mBytesPerPacket = 0

      let convertFormat = AVAudioFormat(streamDescription: &outDesc)!
      converter = AVAudioConverter(from: format, to: convertFormat)

      let packetSize: UInt32 = 8
      let bufferSize = framesPerPacket * packetSize

      tapNode.installTap(onBus: 0, bufferSize: bufferSize, format: format, block: {
        [weak self] (buffer, time) in
        guard let weakself = self else {
          return
        }

        weakself.compressedBuffer = AVAudioCompressedBuffer(
          format: convertFormat,
          packetCapacity: packetSize,
          maximumPacketSize: weakself.converter.maximumOutputPacketSize
        )

        // input block is called when the converter needs input
        let inputBlock : AVAudioConverterInputBlock = { (inNumPackets, outStatus) -> AVAudioBuffer? in
          outStatus.pointee = AVAudioConverterInputStatus.haveData;
          return buffer; // fill and return input buffer
        }

        // Conversion loop
        var outError: NSError? = nil
        weakself.converter.convert(to: weakself.compressedBuffer!, error: &outError, withInputFrom: inputBlock)

        let audioBuffer = weakself.compressedBuffer!.audioBufferList.pointee.mBuffers
        if let mData = audioBuffer.mData {
          let length = Int(audioBuffer.mDataByteSize)
          let data: NSData = NSData(bytes: mData, length: length)
          print("DATA")
            print(data)
        }
        else {
          print("error")
        }
      })

      try engine.start()
      state = .recording
    }

    func stopRecording() {
        mixerNode.removeTap(onBus: 0)
        // engine.inputNode.removeTap(onBus: 0)
        engine.stop()
        converter.reset()
        state = .stopped
    }
    
    func resumeRecording() throws {
        try engine.start()
        state = .recording
    }

    func pauseRecording() {
      engine.pause()
      state = .paused
    }
    
    fileprivate func setupSession() {
      let session = AVAudioSession.sharedInstance()
    try? session.setCategory(.playAndRecord)
      try? session.setActive(true, options: .notifyOthersOnDeactivation)
    }
    
    fileprivate func setupEngine() {
      engine = AVAudioEngine()
        mixerNode = AVAudioMixerNode()

      // Set volume to 0 to avoid audio feedback while recording.
      mixerNode.volume = 0

      engine.attach(mixerNode)

      makeConnections()
      
      // Prepare the engine in advance, in order for the system to allocate the necessary resources.
      engine.prepare()
    }

    fileprivate func makeConnections() {
      let inputNode = engine.inputNode
      let inputFormat = inputNode.outputFormat(forBus: 0)
      engine.connect(inputNode, to: mixerNode, format: inputFormat)

      let mainMixerNode = engine.mainMixerNode
      let mixerFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: inputFormat.sampleRate, channels: 1, interleaved: false)
      engine.connect(mixerNode, to: mainMixerNode, format: mixerFormat)
    }
    
    
}
