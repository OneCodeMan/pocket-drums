//
//  ADKitManager.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-27.
//

import Foundation
import SwiftUI

struct ADKitManager {
    
    // MARK: kits
    static let kits = [tr808_kit, decentkit_kit, elka80_kit, moog_kit, basic_kit]
    static let tr808_kit: ADSoundPack = ADSoundPack(sounds: tr808_sounds, title: "TR 808", internalTitle: "tr808")
    static let decentkit_kit: ADSoundPack = ADSoundPack(sounds: decentkit_sounds, title: "Default", internalTitle: "def1")
    static let elka80_kit: ADSoundPack = ADSoundPack(sounds: elka80_sounds, title: "Elka 80", internalTitle: "elka80")
    static let moog_kit: ADSoundPack = ADSoundPack(sounds: moog_kit_sounds, title: "Moog Acid", internalTitle: "moogacid")
    static let basic_kit: ADSoundPack = ADSoundPack(sounds: basic_kit_sounds, title: "Default2", internalTitle: "default2")
    
    // MARK: sounds
    static let tr808_sounds = [
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
    
   static let decentkit_sounds = [
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
    
    static let elka80_sounds = [
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
    
    static let moog_kit_sounds = [
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
    
    static let basic_kit_sounds = [
        ADOneShotSound(name: "kick 1", fileString: "set2-kick01"),
        ADOneShotSound(name: "kick 2", fileString: "set2-kick02"),
        
        ADOneShotSound(name: "snare 1", fileString: "set2-snare01"),
        ADOneShotSound(name: "snare 2", fileString: "set2-snare02"),
        ADOneShotSound(name: "ohat", fileString: "set2-ohat01"),
        ADOneShotSound(name: "chat", fileString: "set2-chat01"),
        ADOneShotSound(name: "rattle", fileString: "set2-rattle"),
        
        ADOneShotSound(name: "tambourine", fileString: "set2-tamb01"),
        ADOneShotSound(name: "low tom", fileString: "set2-tom01"),
        ADOneShotSound(name: "mid tom", fileString: "set2-tom02"),
        ADOneShotSound(name: "hi tom", fileString: "set2-tom03"),
    ]
    
    // MARK: fx pack
    static let fx_pack_01 = [
        ADOneShotSound(name: "glitch 1", fileString: "glitch1"),
        ADOneShotSound(name: "glitch 2", fileString: "glitch2"),
        ADOneShotSound(name: "laser", fileString: "laser1"),
        ADOneShotSound(name: "synth dub", fileString: "synthdub"),
    ]
}
