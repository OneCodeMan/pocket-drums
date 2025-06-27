//
//  DrumsView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//

// todo: play sound on tap
import SwiftUI
import AVFoundation

struct DrumsView: View {
    @State var player: AVAudioPlayer?
    
    @State private var tappedItem: ADOneShotSound?
    
    let data = [
        ADOneShotSound(name: "kick", fileString: "tr-808-bd-kick-01"),
        ADOneShotSound(name: "snare", fileString: "tr-808-sn-01"),
        ADOneShotSound(name: "chat", fileString: "tr-808-ch-01"),
        ADOneShotSound(name: "cowbell", fileString: "tr-808-cowbell-01"),
        ADOneShotSound(name: "low tom", fileString: "tr-808-lo-tom-01"),
        ADOneShotSound(name: "mid tom", fileString: "tr-808-mi-tom-01"),
        ADOneShotSound(name: "high tom", fileString: "tr-808-hi-tom-01"),
        ADOneShotSound(name: "low conga", fileString: "tr-808-low-conga-01"),
        ADOneShotSound(name: "mid conga", fileString: "tr-808-mid-conga-01"),
    ]
    
    let data2 = [
        ADOneShotSound(name: "kick", fileString: "set2-kick01"),
        ADOneShotSound(name: "snare", fileString: "set2-snare01"),
        ADOneShotSound(name: "chat", fileString: "set2-chat01"),
        ADOneShotSound(name: "ohat", fileString: "set2-ohat01"),
        ADOneShotSound(name: "crash", fileString: "set2-crash01"),
        ADOneShotSound(name: "low tom", fileString: "set2-tom01"),
        ADOneShotSound(name: "mid tom", fileString: "set2-tom02"),
        ADOneShotSound(name: "high tom", fileString: "set2-tom03"),
        ADOneShotSound(name: "tambourine", fileString: "set2-tamb01"),
        ADOneShotSound(name: "rattle", fileString: "set2-rattle"),
        
    ]
    
    let data3 = [
        ADOneShotSound(name: "kick", fileString: "Elka80-Kick"),
        ADOneShotSound(name: "snare", fileString: "Elka80-Snare"),
        ADOneShotSound(name: "chat", fileString: "Elka80-ClosedHat"),
        ADOneShotSound(name: "ohat", fileString: "Elka80-OpenHat"),
        ADOneShotSound(name: "crash", fileString: "Elka80-Crash"),
        ADOneShotSound(name: "low tom", fileString: "Elka80-LowTom"),
        ADOneShotSound(name: "mid tom", fileString: "Elka80-MidTom"),
        ADOneShotSound(name: "high tom", fileString: "Elka80-HiTom"),
        ADOneShotSound(name: "triangle", fileString: "Elka80-LongTriangle"),
        ADOneShotSound(name: "shaker", fileString: "Elka80-Shaker2"),
        ADOneShotSound(name: "guiro", fileString: "Elka80-Guiro"),
        
    ]
    
    let data_alt = [
        ADOneShotSound(name: "kick 1", fileString: "moog_kick_01"),
        ADOneShotSound(name: "kick 2", fileString: "moog_kick_02"),
        
        ADOneShotSound(name: "snare 1", fileString: "moog_snare_01"),
        ADOneShotSound(name: "snare 2", fileString: "moog_snare_02"),
        ADOneShotSound(name: "snare 3", fileString: "moog_snare_03"),
        ADOneShotSound(name: "snare 4", fileString: "moog_snare_04"),
        ADOneShotSound(name: "snare 5", fileString: "moog_snare_05"),
        
        ADOneShotSound(name: "chat", fileString: "moog_chat_01"),
        ADOneShotSound(name: "rim", fileString: "moog_prc_01"),
        
    ]
    
    let fx = [
        ADOneShotSound(name: "glitch 1", fileString: "glitch1"),
        ADOneShotSound(name: "glitch 2", fileString: "glitch2"),
        ADOneShotSound(name: "laser", fileString: "laser1"),
        ADOneShotSound(name: "synth dub", fileString: "synthdub"),
    ]

       let columns = [
           GridItem(.adaptive(minimum: 80))
       ]

       var body: some View {
           ScrollView {
               LazyVGrid(columns: columns, spacing: 10) {
                   ForEach(data3, id: \.self) { item in
                       Button(action: {
                           tappedItem = item
                           playSound(soundName: item.fileString)

                           // Reset the tapped state after a short delay
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                               tappedItem = nil
                           }
                       }) {
                           Text(item.name)
                               .frame(minWidth: 40, minHeight: 40)
                               .padding()
                               .background(tappedItem == item ? Color.purple : Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(8)
                       }
                   }
               }
               .padding(.horizontal)
               .padding(.top, 20)
               
               Spacer()
               
               LazyVGrid(columns: columns, spacing: 10) {
                   ForEach(fx, id: \.self) { item in
                       Button(action: {
                           tappedItem = item
                           playSound(soundName: item.fileString)

                           // Reset the tapped state after a short delay
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                               tappedItem = nil
                           }
                       }) {
                           Text(item.name)
                               .frame(minWidth: 40, minHeight: 40)
                               .padding()
                               .background(tappedItem == item ? Color.green : Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(8)
                       }
                   }
               }
               .padding(.top, 12)
               .padding(.horizontal)
               
               
           }
           .padding(12)
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
