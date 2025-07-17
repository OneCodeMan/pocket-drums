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
    
    @State var isAnimating: Bool = false
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(AngularGradient(colors: [.teal, .pink, .teal], center: .center, angle: .degrees(isAnimating ? 360 : 0)))
                .frame(width: 90, height: 60)
                .blur(radius: 5)
                .onAppear {
                    withAnimation(Animation.linear(duration: 7).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
            
            Button {
                
                playSound(soundName: item.fileString)
                
                isSelected = true
                
                // Reset the tapped state after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    isSelected = false
                }
                
            } label: {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            }
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

// for loops
struct ADOneShotLoopView: View {
    
    @State var player: AVAudioPlayer?
    
    @State var item: ADOneShotSound
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack {
            BrutoButton(text: .constant(item.name), action: {
                
                if isActive {
                    player?.stop()
                    isActive = false
                } else {
                    playSound(soundName: item.fileString)
                    
                    isActive = true
                }
                

            })
            .frame(maxWidth: 50, maxHeight: 50)
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
    // TODO: make this repeating.
    private func playSound(soundName: String, soundVol: Float = 0.3) {
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
                player?.numberOfLoops = -1 // infinite
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
}
