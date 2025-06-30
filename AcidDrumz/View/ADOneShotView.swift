//
//  ADOneShotView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

import SwiftUI
import AVFoundation

struct ADOneShotView: View {
    
    @State var player: AVAudioPlayer?
    
    @State var item: ADOneShotSound
    
    @State var selectedColour: Color = Color.ADOneShotGambogeTapState
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                playSound(soundName: item.fileString)
                
                isSelected = true

                // Reset the tapped state after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isSelected = false
                }
            }) {
                Text(item.name)
                    .frame(minWidth: 40, minHeight: 40)
                    .padding()
                    .background(isSelected ? selectedColour : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
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
