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

    @State var currentModeOnScreen: ADWorkMode = .ADAutechreMode
    @AppStorage("selectedKitID") var selectedKitID: String?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                switch currentModeOnScreen {
                case .ADSquarepusherMode:
                    ADSquarePusherView(selectedKitString: selectedKitID ?? "tr808")
                case .ADAutechreMode:
                    ADAutechreView()
                }
            }
            .navigationTitle(currentModeOnScreen.description)
            .toolbar {
//                // This is setting up the item as the primary action for this toolbar
//                ToolbarItem(placement: .primaryAction) {
//                    Button("New", systemImage: "plus") {
//                        // TODO: - Do something
//                    }
//                }
                // This is setting up the item specifically in the position at the top left corner
                ToolbarItem(placement: .topBarLeading) {
                    Menu("More", systemImage: "ellipsis") {
                        Button("Autechre Mode", systemImage: "pencil") {
                            if currentModeOnScreen != .ADAutechreMode {
                                currentModeOnScreen = .ADAutechreMode
                            }
                            
                        }
                        
                        Button("Squarepusher Mode", systemImage: "shield.pattern.checkered") {
                            if currentModeOnScreen != .ADSquarepusherMode {
                                currentModeOnScreen = .ADSquarepusherMode
                            }
                        }
                    }
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
    
}
