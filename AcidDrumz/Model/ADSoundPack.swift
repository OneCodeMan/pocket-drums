//
//  ADDrumKit.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-27.
//

import Foundation

struct ADSoundPack: Hashable {
    var id = UUID()
    var sounds: [ADOneShotSound] = []
    var title: String = "Untitled Sound Kit"
    var internalTitle: String = "" // id for @AppStorage
    
    init(sounds: [ADOneShotSound], title: String, internalTitle: String) {
        self.sounds = sounds
        self.title = title
        self.internalTitle = internalTitle
    }
    
    init() {
        self.sounds = []
        self.title = ""
        self.internalTitle = ""
    }
    
}
