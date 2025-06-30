//
//  AcidDrumzApp.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//

import SwiftUI

@main
struct AcidDrumzApp: App {
    @AppStorage("selectedKitID") var selectedKitID: String?
    
    var body: some Scene {
        WindowGroup {
            SquarePusherView(selectedKitString: selectedKitID ?? "tr808")
        }
    }
}
