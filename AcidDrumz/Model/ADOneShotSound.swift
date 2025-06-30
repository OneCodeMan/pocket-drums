//
//  ADOneShotSound.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-26.
//
import Foundation
import SwiftUI

// MARK: ADOneShotSound
/**
    One shot sound struct containing name of sound (what will be displayed on button) and file string of sound path.
 */
struct ADOneShotSound: Hashable {
    var id = UUID()
    var name: String
    var fileString: String
    var activeColour: Color = .brown
    
    init(name: String, fileString: String) {
        self.name = name
        self.fileString = fileString
        
        determineActiveColour()
    }
    
    init() {
        self.name = "Untitled Sound"
        self.fileString = "none"
    }
    
    // MARK: Helpers
    private mutating func determineActiveColour() {
        if self.name.contains("chat") {
            self.activeColour = .ADOneShotGambogeTapState
        } else if self.name.contains("tom") {
            self.activeColour = .ADOneShotDiscoVioletTapState
        } else if self.name.contains("kick") {
            self.activeColour = .ADOneShotSoirBleuTapState
        } else if self.name.contains("snare") {
            self.activeColour = .ADOneShotGreenTapState
        } else {
            self.activeColour = .ADOneShotPurpleTapState
        }
    }
}
