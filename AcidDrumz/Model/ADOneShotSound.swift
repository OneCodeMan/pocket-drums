//
//  ADOneShotSound.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//
import Foundation

// MARK: ADOneShotSound
/**
    One shot sound struct containing name of sound (what will be displayed on button) and file string of sound path.
 */
struct ADOneShotSound: Hashable {
    var id = UUID()
    var name: String
    var fileString: String
    
    init(name: String, fileString: String) {
        self.name = name
        self.fileString = fileString
    }
    
    init() {
        self.name = "Untitled Sound"
        self.fileString = "none"
    }
}
