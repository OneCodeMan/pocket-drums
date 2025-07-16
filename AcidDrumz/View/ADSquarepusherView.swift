//
//  DrumsView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//
import SwiftUI
import AVFoundation
import ReplayKit

struct ADSquarePusherView: View {
    @AppStorage("selectedKitID") var selectedKitID: String?
    
    @State var player: AVAudioPlayer?
    
    @State var selectedKitString: String
    @State private var selectedKit: ADSoundPack = ADKitManager.tr808_kit
    @State private var selectedFX: ADSoundPack = ADKitManager.fxpack1_kit
    let recorder = RPScreenRecorder.shared()
    @State private var isRecording = false
    @State private var isShowPreviewVideo = false
    @State private var displayProgressView = false
    @State private var rp: RPPreviewView!

   let columns = [
       GridItem(.adaptive(minimum: 80))
   ]

   var body: some View {
       ZStack {
           ScrollView {
               
               // MARK: Menu
               // TODO: put this in a context menu
               HStack {
                   // this is where the last kit is selected for appstorage
                   VStack {
                       Text("Kit")
                       
                       Picker("Kit", selection: $selectedKit) {
                           ForEach(ADKitManager.kits, id: \.self) {
                               Text($0.title)
                           }
                       }
                       .pickerStyle(.menu)
                   }
                   
                   Spacer()
                       .frame(width: 70)
                   
                   VStack {
                       Text("FX")
                       
                       Picker("FX", selection: $selectedFX) {
                           ForEach(ADKitManager.fxkits, id: \.self) {
                               Text($0.title)
                           }
                       }
                       .pickerStyle(.menu)
                   }
                   
                   

                   
               }
               
               LazyVGrid(columns: columns, spacing: 10) {
                   ForEach(selectedKit.sounds, id: \.self) { item in
                       ADOneShotView(item: item)
                   }
               }
               .padding(.horizontal)
               .padding(.top, 20)
               
               Divider()
               
               LazyVGrid(columns: columns, spacing: 10) {
                   ForEach(selectedFX.sounds, id: \.self) { item in
                       ADOneShotView(item: item)
                   }
               }
               .padding(.top, 12)
               .padding(.horizontal)
               
               Divider()
               
               // MARK: Record
               VStack {
                   
                   if displayProgressView {
                       // TODO: disable all buttons here?
                       ProgressView()
                   } else {
                       HStack {
                           
                           if !isRecording {
                               Button {
                                   print("record")
                                   Task {
                                       startRecord()
                                   }
                               } label: {
                                   Image(systemName: "record.circle")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 25, height: 25)
                                       .foregroundStyle(Color.ADAutechrePlayButton)
                               }
                               .buttonStyle(.borderedProminent)
                               .buttonBorderShape(.roundedRectangle)
                               .tint(.clear)
                           } else {
                               Button {
                                   print("stop")
                                   Task {
                                       stopRecord()
                                   }
                               } label: {
                                   Image(systemName: "stop.circle")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 25, height: 25)
                                       .foregroundStyle(Color.red)
                               }
                               .buttonStyle(.borderedProminent)
                               .buttonBorderShape(.roundedRectangle)
                               .tint(.clear)
                           }
                          
                       }
                       
                       Text(!isRecording ? "Tap to record" : "RECORDING IN PROGRESS")
                   }
                   
                   
                   
               }
               .padding()
               
               
           }
           
           if isShowPreviewVideo {
               rp
                   .transition(.move(edge: .bottom))
                   .edgesIgnoringSafeArea(.all)
           }
       }
       .padding(12)
       .task {
           // set selectedkit based off of appstorage if possible.
           selectedKit = ADKitManager.kits.first(where: { $0.internalTitle == selectedKitString }) ?? ADKitManager.elka80_kit
       }
       .onDisappear {
           // update appstorage with the last selected kit
           selectedKitID = selectedKit.internalTitle
           stopRecord()
       }
       
       
   }
    
    func startRecord() {
        guard recorder.isAvailable else {
            print("Recording is not available at this time.")
            return
        }

        if !recorder.isRecording {
            recorder.startRecording { error in
                guard error == nil else {
                    print("There was an error starting the recording: \(error!)")
                    return
                }

                print("Started Recording Successfully")
                isRecording = true
            }
        }
    }

    func stopRecord() {
        displayProgressView = true
        
        recorder.stopRecording { preview, error in
            print("Stopped recording")
            isRecording = false

            guard let preview = preview else {
                print("Preview controller is not available.")
                return
            }

            rp = RPPreviewView(rpPreviewViewController: preview, isShow: $isShowPreviewVideo)

            withAnimation {
                isShowPreviewVideo = true
                displayProgressView = false
            }
        }
    }
    
    func playSound(soundName: String, soundVol: Float = 1.0) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else {
            print("path not created")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            // DOES NOT PLAY SOUND WITHOUT THIS
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = soundVol
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

