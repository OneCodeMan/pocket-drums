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
    @AppStorage("selectedKitID") var selectedKitID: String?
    
    @State var player: AVAudioPlayer?
    
    @State var selectedKitString: String
    @State private var selectedKit: ADSoundPack = ADKitManager.tr808_kit
    @State private var tappedItem: ADOneShotSound?

   let columns = [
       GridItem(.adaptive(minimum: 80))
   ]

   var body: some View {
       ScrollView {
           LazyVGrid(columns: columns, spacing: 10) {
               ForEach(selectedKit.sounds, id: \.self) { item in
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
           
           Divider()
           
           LazyVGrid(columns: columns, spacing: 10) {
               ForEach(ADKitManager.fx_pack_01, id: \.self) { item in
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
           
           
           // MARK: Menu
           VStack {
               // this is where the last kit is selected for appstorage
               Picker("Select Kit", selection: $selectedKit) {
                   ForEach(ADKitManager.kits, id: \.self) {
                       Text($0.title)
                   }
               }
               .pickerStyle(.menu)

               Text("Selected Kit: \(selectedKit.title)")
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
