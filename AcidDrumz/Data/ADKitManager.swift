//
//  ADKitManager.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-27.
//

import Foundation
import SwiftUI

struct ADKitManager {
    
    // TODO: build your own kit
    static let master_lists = [
        master_kickz,   master_cymbals,
        master_snares,
        master_chats,
        master_ohats,
        master_toms
    ]
    static let master_kickz = [
        ADOneShotSound(name: "kick", fileString: "tr-808-bd-kick-01"),
        ADOneShotSound(name: "kick", fileString: "XE8 Kick 1 int_1"),
        ADOneShotSound(name: "kick", fileString: "XE8 Kick 2 int_2"),
        ADOneShotSound(name: "kick", fileString: "XE8 Kick 3 int_3"),
        ADOneShotSound(name: "kick", fileString: "XE8 Kick ext_1"),
        ADOneShotSound(name: "kick", fileString: "CMD8_Kick"),
        ADOneShotSound(name: "kick", fileString: "Clavia-Kick 2"),
        ADOneShotSound(name: "kick", fileString: "Clavia-Kick 3"),
        ADOneShotSound(name: "kick", fileString: "Clavia-Kick 4"),
        ADOneShotSound(name: "kick", fileString: "Clavia-Kick 5"),
        ADOneShotSound(name: "kick", fileString: "Elka80-Kick"),
        ADOneShotSound(name: "kick", fileString: "Elka80-Kick2"),
        ADOneShotSound(name: "kick", fileString: "emu-k1"),
        ADOneShotSound(name: "kick", fileString: "emu-k2"),
        ADOneShotSound(name: "kick", fileString: "JXB-Bassdrum2"),
        ADOneShotSound(name: "kick", fileString: "JXB-Bassdrum4"),
        ADOneShotSound(name: "kick", fileString: "JXB-Bassdrum15"),
        ADOneShotSound(name: "kick", fileString: "JXB-Bassdrum69"),
        ADOneShotSound(name: "kick", fileString: "DRM-1 BD1"),
        ADOneShotSound(name: "kick", fileString: "DRM-1 BD3"),
        ADOneShotSound(name: "kick", fileString: "A-LinnBD_1"),
        ADOneShotSound(name: "kick", fileString: "A-LinnBD_6"),
        ADOneShotSound(name: "kick", fileString: "moog_kick_01"),
        ADOneShotSound(name: "kick", fileString: "moog_kick_02"),
        ADOneShotSound(name: "kick", fileString: "szapp-bd1"),
        ADOneShotSound(name: "kick", fileString: "an200-bd1"),
        ADOneShotSound(name: "kick", fileString: "an200-bd2"),
        ADOneShotSound(name: "kick", fileString: "set2-kick01"),
        ADOneShotSound(name: "kick", fileString: "set2-kick02"),
    ]
    
    static let master_snares = [
        ADOneShotSound(name: "snare", fileString: "XE Snare 1 int_8"),
        ADOneShotSound(name: "snare", fileString: "XE Snare 2 int_9"),
        ADOneShotSound(name: "snare", fileString: "XE Snare 3 int_10"),
        ADOneShotSound(name: "snare", fileString: "XE Snare ext_2"),
        ADOneShotSound(name: "snare", fileString: "tr-808-sn-01"),
        ADOneShotSound(name: "snare", fileString: "CMD8_Snare"),
        ADOneShotSound(name: "snare", fileString: "Clavia-Snare 3"),
        ADOneShotSound(name: "snare", fileString: "Clavia-Snare 4"),
        ADOneShotSound(name: "snare", fileString: "Clavia-Snare 5"),
        ADOneShotSound(name: "snare", fileString: "Elka80-Snare"),
        ADOneShotSound(name: "snare", fileString: "Elka80-Snare2"),
        ADOneShotSound(name: "snare", fileString: "emu-sn1"),
        ADOneShotSound(name: "snare", fileString: "emu-sn2"),
        ADOneShotSound(name: "snare", fileString: "emu-sn3"),
        ADOneShotSound(name: "snare", fileString: "JXB-Snare02"),
        ADOneShotSound(name: "snare", fileString: "JXB-Snare05"),
        ADOneShotSound(name: "snare", fileString: "JXB-Snare06"),
        ADOneShotSound(name: "snare", fileString: "DRM-1 SD2"),
        ADOneShotSound(name: "snare", fileString: "DRM-1 SD4"),
        ADOneShotSound(name: "snare", fileString: "A-LinnSNR_2"),
        ADOneShotSound(name: "snare", fileString: "A-LinnSNR_4"),
        ADOneShotSound(name: "snare", fileString: "A-LinnSNR_6"),
        ADOneShotSound(name: "snare", fileString: "moog_snare_01"),
        ADOneShotSound(name: "snare", fileString: "moog_snare_02"),
        ADOneShotSound(name: "snare", fileString: "moog_snare_03"),
        ADOneShotSound(name: "snare", fileString: "moog_snare_04"),
        ADOneShotSound(name: "snare", fileString: "moog_snare_05"),
        ADOneShotSound(name: "snare", fileString: "set2_snare01"),
        ADOneShotSound(name: "snare", fileString: "set2_snare02"),
        ADOneShotSound(name: "snare", fileString: "szapp_sn1"),
        ADOneShotSound(name: "snare", fileString: "szapp_sn2"),
        ADOneShotSound(name: "snare", fileString: "an200-sn1"),
        ADOneShotSound(name: "snare", fileString: "an200-sn2"),
    ]
    
    static let master_chats = [
        ADOneShotSound(name: "chat", fileString: "XE8 Hat Closed ext_4"),
        ADOneShotSound(name: "chat", fileString: "XE8 Hat Closed int_5"),
        ADOneShotSound(name: "chat", fileString: "tr-808-ch-01"),
        ADOneShotSound(name: "chat", fileString: "CMD8_Hihat_Closed"),
        ADOneShotSound(name: "chat", fileString: "Elka80-ClosedHat"),
        ADOneShotSound(name: "chat", fileString: "emu-ch1"),
        ADOneShotSound(name: "chat", fileString: "JXB-Clhh01"),
        ADOneShotSound(name: "chat", fileString: "JXB-Clhh02"),
        ADOneShotSound(name: "chat", fileString: "JXB-Clhh03"),
        ADOneShotSound(name: "chat", fileString: "DRM-1 Chh1"),
        ADOneShotSound(name: "chat", fileString: "DRM-1 Chh2"),
        ADOneShotSound(name: "chat", fileString: "A-LinnHH_1"),
        ADOneShotSound(name: "chat", fileString: "A-LinnHH_4"),
        ADOneShotSound(name: "chat", fileString: "moog_chat_01"),
        ADOneShotSound(name: "chat", fileString: "set2-chat01"),
        ADOneShotSound(name: "chat", fileString: "szapp-hat1"),
        ADOneShotSound(name: "chat", fileString: "szapp-hat1"),
    ]
    
    static let master_toms = [
        ADOneShotSound(name: "tom", fileString: "XE8 Tom 1 ext_6"),
        ADOneShotSound(name: "tom", fileString: "XE8 Tom 2 ext_7"),
        ADOneShotSound(name: "tom", fileString: "XE8 Tom 3 ext_8"),
        ADOneShotSound(name: "tom", fileString: "XE8 Tom High int_12"),
        ADOneShotSound(name: "tom", fileString: "XE8 Tom Low int_11"),
        ADOneShotSound(name: "tom", fileString: "tr-808-hi-tom-01"),
        ADOneShotSound(name: "tom", fileString: "tr-808-lo-tom-01"),
        ADOneShotSound(name: "tom", fileString: "tr-808-mi-tom-01"),
        ADOneShotSound(name: "tom", fileString: "Clavia-Tom1"),
        ADOneShotSound(name: "tom", fileString: "Clavia-Tom2"),
        ADOneShotSound(name: "tom", fileString: "Clavia-Tom3"),
        ADOneShotSound(name: "tom", fileString: "Elka80-BigTom"),
        ADOneShotSound(name: "tom", fileString: "Elka80-HiTom"),
        ADOneShotSound(name: "tom", fileString: "Elka80-LowTom"),
        ADOneShotSound(name: "tom", fileString: "Elka80-MidTom"),
        ADOneShotSound(name: "tom", fileString: "emu-tom1"),
        ADOneShotSound(name: "tom", fileString: "emu-tom2"),
        ADOneShotSound(name: "tom", fileString: "DRM-1 Tom1"),
        ADOneShotSound(name: "tom", fileString: "DRM-1 Tom3"),
        ADOneShotSound(name: "tom", fileString: "A-LinnTomhi"),
        ADOneShotSound(name: "tom", fileString: "A-LinnTomlo"),
        ADOneShotSound(name: "tom", fileString: "set2-tom01"),
        ADOneShotSound(name: "tom", fileString: "set2-tom02"),
        ADOneShotSound(name: "tom", fileString: "set2-tom03"),
    ]
    
    static let master_cymbals = [
        ADOneShotSound(name: "cymbal", fileString: "XE8 Crash ext_11"),
        ADOneShotSound(name: "cymbal", fileString: "XE8 Crash int_13"),
        ADOneShotSound(name: "cymbal", fileString: "Clavia-Cymb 2"),
        ADOneShotSound(name: "cymbal", fileString: "Clavia-Cymb 3"),
        ADOneShotSound(name: "cymbal", fileString: "Elka80-Crash"),
        ADOneShotSound(name: "cymbal", fileString: "JXB-Crash02"),
        ADOneShotSound(name: "cymbal", fileString: "set2-crash01"),
    ]
    
    static let master_ohats = [
        ADOneShotSound(name: "ohat", fileString: "XE8 Hat Open ext_5"),
        ADOneShotSound(name: "ohat", fileString: "XE8 Hat Open int_7"),
        ADOneShotSound(name: "ohat", fileString: "CMD8_Hihat_Open"),
        ADOneShotSound(name: "ohat", fileString: "Elka80-OpenHat"),
        ADOneShotSound(name: "ohat", fileString: "Elka80-OpenHat2"),
        ADOneShotSound(name: "ohat", fileString: "emu-oh1"),
        ADOneShotSound(name: "ohat", fileString: "JXB-Ophh01"),
        ADOneShotSound(name: "ohat", fileString: "JXB-Ophh02"),
        ADOneShotSound(name: "ohat", fileString: "A-LinnHHOp"),
        ADOneShotSound(name: "ohat", fileString: "set2-ohat01"),
    ]
    
    static let master_percs = [
        ADOneShotSound(name: "perc", fileString: "XE8 Block 1 ext_14"),
        ADOneShotSound(name: "perc", fileString: "XE8 Clap int_15"),
        ADOneShotSound(name: "perc", fileString: "XE8 Cowbell 1 ext_12"),
        ADOneShotSound(name: "perc", fileString: "tr-808-cowbell-01"),
        ADOneShotSound(name: "perc", fileString: "tr-808-low-conga-01"),
        ADOneShotSound(name: "perc", fileString: "tr-808-mid-conga-01"),
        ADOneShotSound(name: "perc", fileString: "CMD8_Clap"),
        ADOneShotSound(name: "perc", fileString: "CMD8_Cowbell"),
        ADOneShotSound(name: "perc", fileString: "Clavia-Perc 1"),
        ADOneShotSound(name: "perc", fileString: "Clavia-Perc 2"),
        ADOneShotSound(name: "perc", fileString: "Clavia-Perc 5"),
        ADOneShotSound(name: "perc", fileString: "Clavia-Perc 6"),
        ADOneShotSound(name: "perc", fileString: "Elka80-Clave"),
        ADOneShotSound(name: "perc", fileString: "Elka80-GatorTambourine"),
        ADOneShotSound(name: "perc", fileString: "Elka80-Guiro"),
        ADOneShotSound(name: "perc", fileString: "Elka80-Shaker2"),
        ADOneShotSound(name: "perc", fileString: "emu-clap1"),
        ADOneShotSound(name: "perc", fileString: "emu-rim1"),
        ADOneShotSound(name: "perc", fileString: "emu-p1"),
        ADOneShotSound(name: "perc", fileString: "JXB-Rim02"),
        ADOneShotSound(name: "perc", fileString: "DRM-1 Conga2"),
        ADOneShotSound(name: "perc", fileString: "DRM-1 Conga3"),
        ADOneShotSound(name: "perc", fileString: "DRM-1 Timb2"),
        ADOneShotSound(name: "perc", fileString: "A-LinnRim"),
        ADOneShotSound(name: "perc", fileString: "A-LinnPerc8"),
        ADOneShotSound(name: "perc", fileString: "moog_prc_01"),
        ADOneShotSound(name: "perc", fileString: "set2-rattle"),
        ADOneShotSound(name: "perc", fileString: "set2-tamb01"),
        ADOneShotSound(name: "perc", fileString: "AN200_03"),
        ADOneShotSound(name: "perc", fileString: "AN200_06"),
        ADOneShotSound(name: "perc", fileString: "AN200_07"),
        ADOneShotSound(name: "perc", fileString: "AN200_08"),
        ADOneShotSound(name: "perc", fileString: "AN200_11"),
        ADOneShotSound(name: "perc", fileString: "AN200_12"),
        ADOneShotSound(name: "perc", fileString: "AN200_13"),
    ]
    
    // MARK: kits
    static let kits = [tr808_kit, decentkit_kit, elka80_kit, moog_kit, basic_kit]
    static let fxkits = [fxpack1_kit, fxpack2_kit, fxpack3_kit]
    static let loopkits = [loopkit1]
    static let tr808_kit: ADSoundPack = ADSoundPack(sounds: tr808_sounds, title: "TR 808", internalTitle: "tr808")
    static let decentkit_kit: ADSoundPack = ADSoundPack(sounds: decentkit_sounds, title: "Default", internalTitle: "def1")
    static let elka80_kit: ADSoundPack = ADSoundPack(sounds: elka80_sounds, title: "Elka 80", internalTitle: "elka80")
    static let moog_kit: ADSoundPack = ADSoundPack(sounds: moog_kit_sounds, title: "Moog Acid", internalTitle: "moogacid")
    static let basic_kit: ADSoundPack = ADSoundPack(sounds: basic_kit_sounds, title: "Default2", internalTitle: "default2")
    static let fxpack1_kit: ADSoundPack = ADSoundPack(sounds: fx_pack_01, title: "FX 1", internalTitle: "fx1")
    static let fxpack2_kit: ADSoundPack = ADSoundPack(sounds: fx_pack_02, title: "FX 2", internalTitle: "fx2")
    static let fxpack3_kit: ADSoundPack = ADSoundPack(sounds: fx_pack_03, title: "FX 3", internalTitle: "fx3")
    
    static let loopkit1: ADSoundPack = ADSoundPack(sounds: loopspack1_sounds, title: "Loops", internalTitle: "loops")
    static let loopspack1_sounds = [
        ADOneShotSound(name: "loop1", fileString: "FX_ VIDEOSPIELE"),
    ]
    
    static var customKit1 = ADSoundPack(sounds: customKitSounds, title: "Custom Kit", internalTitle: "Custom Drums")
    static var customKitSounds = [
        ADOneShotSound(name: "kick", fileString: "tr-808-bd-kick-01"),
    ]
    
    func handleCustomKit() {
        
    }
    
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
        ADOneShotSound(name: "triangle", fileString: "LongTriangle"),
        ADOneShotSound(name: "laser", fileString: "laser1"),
        ADOneShotSound(name: "synth dub", fileString: "synthdub"),
        ADOneShotSound(name: "rev kick", fileString: "revkick"),
    ]
    
    static let fx_pack_02 = [
        ADOneShotSound(name: "cabasa", fileString: "DRM-1 Cabasa"),
        ADOneShotSound(name: "glitch", fileString: "glitch2"),
        ADOneShotSound(name: "laser", fileString: "laser3"),
        ADOneShotSound(name: "vinyl", fileString: "vinyl-scratch"),
        ADOneShotSound(name: "zap", fileString: "zap1"),
    ]
    
    static let fx_pack_03 = [
        ADOneShotSound(name: "Mito 4", fileString: "Mito 4 TB 303 frog 1"),
    ]
}
