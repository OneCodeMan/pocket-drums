//
//  ADModeView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

/**
 Toggles between Squarepusher mode or Autech mode
 */
import SwiftUI

struct ADModeView: View {

    @State var currentModeOnScreen: ADWorkMode = .ADSquarepusherMode
    @AppStorage("selectedKitID") var selectedKitID: String?
    
    var body: some View {
        ScrollView {
            switch currentModeOnScreen {
            case .ADSquarepusherMode:
                ADSquarePusherView(selectedKitString: selectedKitID ?? "tr808")
            case .ADAutechreMode:
                ADAutechreView()
            }
        }
        .padding(12)
        .task {
            // set selectedkit based off of appstorage if possible.
           
        }
        .onDisappear {
           
        }
    }
    
}
