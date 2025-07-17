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
struct ADOneShotSound: Hashable, Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var fileString: String
    var activeColourName: String = "brown"  // Instead of Color directly
        
    var activeColour: Color {
        Color(activeColourName)
    }
    
    init(name: String, fileString: String) {
        self.name = name
        self.fileString = fileString
        self.activeColourName = ADOneShotSound.getColourName(for: name)
    }
    
    init() {
        self.name = "Untitled Sound"
        self.fileString = "none"
    }
    
    // MARK: Helpers
    // Helper to determine color name
    private static func getColourName(for name: String) -> String {
        if name.contains("chat") {
            return "gamboge"
        } else if name.contains("tom") {
            return "violet"
        } else if name.contains("kick") {
            return "blue"
        } else if name.contains("snare") {
            return "green"
        } else {
            return "purple"
        }
    }
}
