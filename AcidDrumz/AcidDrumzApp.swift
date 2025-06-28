//
//  AcidDrumzApp.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//

import SwiftUI

@main
struct AcidDrumzApp: App {
    @AppStorage("currentKitID") var currentKitID: String = "tr808"
    
    var body: some Scene {
        WindowGroup {
            DrumsView(selectedKit: ADKitManager.tr808_kit)
        }
    }
}
