//
//  ADOneShotView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

/*
 
 BrutoCircleButton(text: .constant("OK"))
         .frame(width: 80)
         .font(.system(size: 30))
         .fontWeight(.black)
 */

import SwiftUI
import AVFoundation

// for drums
struct ADOneShotDrumView: View {
    
    @State var player: AVAudioPlayer?
    
    @State var item: ADOneShotSound
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack {
            BrutoCircleButton(action: {
                playSound(soundName: item.fileString)
                
                isSelected = true

                // Reset the tapped state after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    isSelected = false
                }
            })
            .frame(maxWidth: 75, maxHeight: 75)
//            {
//                // AESTHETIC
//                Text(item.name)
//                    .frame(minWidth: 40, minHeight: 40)
//                    .padding()
//                    .background(isSelected ? item.activeColour : Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
        }
    }
    
    // MARK: helpers
    private func playSound(soundName: String, soundVol: Float = 1.0) {
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

// for fx
struct ADOneShotFXView: View {
    
    @State var player: AVAudioPlayer?
    
    @State var item: ADOneShotSound
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack {
            // TODO: fix thsi shit
            BrutoButton(text: .constant("    "), action: {
                playSound(soundName: item.fileString)
                
                isSelected = true

                // Reset the tapped state after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    isSelected = false
                }
            })
            .frame(maxWidth: 75, maxHeight: 75)
//            {
//                // AESTHETIC
//                Text(item.name)
//                    .frame(minWidth: 40, minHeight: 40)
//                    .padding()
//                    .background(isSelected ? item.activeColour : Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
        }
    }
    
    // MARK: helpers
    private func playSound(soundName: String, soundVol: Float = 1.0) {
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
