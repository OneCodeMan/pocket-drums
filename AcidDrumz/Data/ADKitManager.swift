//
//  ADKitManager.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-27.
//

import Foundation
import SwiftUI

class ADKitStorage: ObservableObject {
    @Published var customKit: [ADOneShotSound] {
        didSet {
            saveCustomKit()
        }
    }

    private let key = "customKit"

    init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([ADOneShotSound].self, from: data) {
            self.customKit = decoded
        } else {
            self.customKit = []
        }
    }

    func saveCustomKit() {
        if let data = try? JSONEncoder().encode(customKit) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func updateKit(with fileStrings: [String]) {
        // Build new kit from your master lists
        let allSounds = ADKitManager.master_lists.flatMap { $0 }
        self.customKit = allSounds.filter { fileStrings.contains($0.fileString) }
    }
}


final class ADKitManager {
    
    static let shared = ADKitManager()
    
    let storage = ADKitStorage()
    
    // TODO: build your own kit
    static let master_lists = [
        master_kickz,   master_cymbals,
        master_snares,
        master_chats,
        master_ohats,
        master_toms
    ]
    static let master_kickz = [
        ADOneShotSound(name: "TR-808 Kick 01", fileString: "tr-808-bd-kick-01"),
        ADOneShotSound(name: "XE8 Kick 1 Int", fileString: "XE8 Kick 1 int_1"),
        ADOneShotSound(name: "XE8 Kick 2 Int", fileString: "XE8 Kick 2 int_2"),
        ADOneShotSound(name: "XE8 Kick 3 Int", fileString: "XE8 Kick 3 int_3"),
        ADOneShotSound(name: "XE8 Kick Ext", fileString: "XE8 Kick ext_1"),
        ADOneShotSound(name: "CMD8 Kick", fileString: "CMD8_Kick"),
        ADOneShotSound(name: "Clavia Kick 2", fileString: "Clavia-Kick 2"),
        ADOneShotSound(name: "Clavia Kick 3", fileString: "Clavia-Kick 3"),
        ADOneShotSound(name: "Clavia Kick 4", fileString: "Clavia-Kick 4"),
        ADOneShotSound(name: "Clavia Kick 5", fileString: "Clavia-Kick 5"),
        ADOneShotSound(name: "Elka80 Kick", fileString: "Elka80-Kick"),
        ADOneShotSound(name: "Elka80 Kick 2", fileString: "Elka80-Kick2"),
        ADOneShotSound(name: "EMU Kick 1", fileString: "emu-k1"),
        ADOneShotSound(name: "EMU Kick 2", fileString: "emu-k2"),
        ADOneShotSound(name: "JXB Bassdrum 2", fileString: "JXB-Bassdrum2"),
        ADOneShotSound(name: "JXB Bassdrum 4", fileString: "JXB-Bassdrum4"),
        ADOneShotSound(name: "JXB Bassdrum 15", fileString: "JXB-Bassdrum15"),
        ADOneShotSound(name: "JXB Bassdrum 69", fileString: "JXB-Bassdrum69"),
        ADOneShotSound(name: "DRM-1 BD1", fileString: "DRM-1 BD1"),
        ADOneShotSound(name: "DRM-1 BD3", fileString: "DRM-1 BD3"),
        ADOneShotSound(name: "A-Linn BD 1", fileString: "A-LinnBD_1"),
        ADOneShotSound(name: "A-Linn BD 6", fileString: "A-LinnBD_6"),
        ADOneShotSound(name: "Moog Kick 1", fileString: "moog_kick_01"),
        ADOneShotSound(name: "Moog Kick 2", fileString: "moog_kick_02"),
        ADOneShotSound(name: "Szapp BD 1", fileString: "szapp-bd1"),
        ADOneShotSound(name: "AN200 BD 1", fileString: "an200-bd1"),
        ADOneShotSound(name: "AN200 BD 2", fileString: "an200-bd2"),
        ADOneShotSound(name: "Set 2 Kick 01", fileString: "set2-kick01"),
        ADOneShotSound(name: "Set 2 Kick 02", fileString: "set2-kick02")
    ]
    
    static let master_snares = [
        ADOneShotSound(name: "Xe Snare 1 Int 8", fileString: "XE Snare 1 int_8"),
        ADOneShotSound(name: "Xe Snare 2 Int 9", fileString: "XE Snare 2 int_9"),
        ADOneShotSound(name: "Xe Snare 3 Int 10", fileString: "XE Snare 3 int_10"),
        ADOneShotSound(name: "Xe Snare Ext 2", fileString: "XE Snare ext_2"),
        ADOneShotSound(name: "Tr 808 Snare 01", fileString: "tr-808-sn-01"),
        ADOneShotSound(name: "Cmd8 Snare", fileString: "CMD8_Snare"),
        ADOneShotSound(name: "Clavia Snare 3", fileString: "Clavia-Snare 3"),
        ADOneShotSound(name: "Clavia Snare 4", fileString: "Clavia-Snare 4"),
        ADOneShotSound(name: "Clavia Snare 5", fileString: "Clavia-Snare 5"),
        ADOneShotSound(name: "Elka80 Snare", fileString: "Elka80-Snare"),
        ADOneShotSound(name: "Elka80 Snare2", fileString: "Elka80-Snare2"),
        ADOneShotSound(name: "Emu Snare1", fileString: "emu-sn1"),
        ADOneShotSound(name: "Emu Snare2", fileString: "emu-sn2"),
        ADOneShotSound(name: "Emu Snare3", fileString: "emu-sn3"),
        ADOneShotSound(name: "Jxb Snare02", fileString: "JXB-Snare02"),
        ADOneShotSound(name: "Jxb Snare05", fileString: "JXB-Snare05"),
        ADOneShotSound(name: "Jxb Snare06", fileString: "JXB-Snare06"),
        ADOneShotSound(name: "Drm 1 Snare2", fileString: "DRM-1 SD2"),
        ADOneShotSound(name: "Drm 1 Snare4", fileString: "DRM-1 SD4"),
        ADOneShotSound(name: "A Linn Snare 2", fileString: "A-LinnSNR_2"),
        ADOneShotSound(name: "A Linn Snare 4", fileString: "A-LinnSNR_4"),
        ADOneShotSound(name: "A Linn Snare 6", fileString: "A-LinnSNR_6"),
        ADOneShotSound(name: "Moog Snare 01", fileString: "moog_snare_01"),
        ADOneShotSound(name: "Moog Snare 02", fileString: "moog_snare_02"),
        ADOneShotSound(name: "Moog Snare 03", fileString: "moog_snare_03"),
        ADOneShotSound(name: "Moog Snare 04", fileString: "moog_snare_04"),
        ADOneShotSound(name: "Moog Snare 05", fileString: "moog_snare_05"),
        ADOneShotSound(name: "Set2 Snare01", fileString: "set2_snare01"),
        ADOneShotSound(name: "Set2 Snare02", fileString: "set2_snare02"),
        ADOneShotSound(name: "Szapp Snare1", fileString: "szapp_sn1"),
        ADOneShotSound(name: "Szapp Snare2", fileString: "szapp_sn2"),
        ADOneShotSound(name: "An200 Snare1", fileString: "an200-sn1"),
        ADOneShotSound(name: "An200 Snare2", fileString: "an200-sn2"),
    ]

    static let master_chats = [
        ADOneShotSound(name: "Xe8 Hat Closed Ext 4", fileString: "XE8 Hat Closed ext_4"),
        ADOneShotSound(name: "Xe8 Hat Closed Int 5", fileString: "XE8 Hat Closed int_5"),
        ADOneShotSound(name: "Tr 808 Closed Hat 01", fileString: "tr-808-ch-01"),
        ADOneShotSound(name: "Cmd8 Hihat Closed", fileString: "CMD8_Hihat_Closed"),
        ADOneShotSound(name: "Elka80 Closedhat", fileString: "Elka80-ClosedHat"),
        ADOneShotSound(name: "Emu Closed Hat1", fileString: "emu-ch1"),
        ADOneShotSound(name: "Jxb Closed Hat01", fileString: "JXB-Clhh01"),
        ADOneShotSound(name: "Jxb Closed Hat02", fileString: "JXB-Clhh02"),
        ADOneShotSound(name: "Jxb Closed Hat03", fileString: "JXB-Clhh03"),
        ADOneShotSound(name: "Drm 1 Closed Hat1", fileString: "DRM-1 Chh1"),
        ADOneShotSound(name: "Drm 1 Closed Hat2", fileString: "DRM-1 Chh2"),
        ADOneShotSound(name: "A Linn Hat 1", fileString: "A-LinnHH_1"),
        ADOneShotSound(name: "A Linn Hat 4", fileString: "A-LinnHH_4"),
        ADOneShotSound(name: "Moog Chat 01", fileString: "moog_chat_01"),
        ADOneShotSound(name: "Set2 Chat01", fileString: "set2-chat01"),
        ADOneShotSound(name: "Szapp Hat1", fileString: "szapp-hat1"),
        ADOneShotSound(name: "Szapp Hat1", fileString: "szapp-hat1"),
    ]

    static let master_toms = [
        ADOneShotSound(name: "Xe8 Tom 1 Ext 6", fileString: "XE8 Tom 1 ext_6"),
        ADOneShotSound(name: "Xe8 Tom 2 Ext 7", fileString: "XE8 Tom 2 ext_7"),
        ADOneShotSound(name: "Xe8 Tom 3 Ext 8", fileString: "XE8 Tom 3 ext_8"),
        ADOneShotSound(name: "Xe8 Tom High Int 12", fileString: "XE8 Tom High int_12"),
        ADOneShotSound(name: "Xe8 Tom Low Int 11", fileString: "XE8 Tom Low int_11"),
        ADOneShotSound(name: "Tr 808 Hi Tom 01", fileString: "tr-808-hi-tom-01"),
        ADOneShotSound(name: "Tr 808 Lo Tom 01", fileString: "tr-808-lo-tom-01"),
        ADOneShotSound(name: "Tr 808 Mi Tom 01", fileString: "tr-808-mi-tom-01"),
        ADOneShotSound(name: "Clavia Tom1", fileString: "Clavia-Tom1"),
        ADOneShotSound(name: "Clavia Tom2", fileString: "Clavia-Tom2"),
        ADOneShotSound(name: "Clavia Tom3", fileString: "Clavia-Tom3"),
        ADOneShotSound(name: "Elka80 Bigtom", fileString: "Elka80-BigTom"),
        ADOneShotSound(name: "Elka80 Hitom", fileString: "Elka80-HiTom"),
        ADOneShotSound(name: "Elka80 Lowtom", fileString: "Elka80-LowTom"),
        ADOneShotSound(name: "Elka80 Midtom", fileString: "Elka80-MidTom"),
        ADOneShotSound(name: "Emu Tom1", fileString: "emu-tom1"),
        ADOneShotSound(name: "Emu Tom2", fileString: "emu-tom2"),
        ADOneShotSound(name: "Drm 1 Tom1", fileString: "DRM-1 Tom1"),
        ADOneShotSound(name: "Drm 1 Tom3", fileString: "DRM-1 Tom3"),
        ADOneShotSound(name: "A Linn Tomhi", fileString: "A-LinnTomhi"),
        ADOneShotSound(name: "A Linn Tomlo", fileString: "A-LinnTomlo"),
        ADOneShotSound(name: "Set2 Tom01", fileString: "set2-tom01"),
        ADOneShotSound(name: "Set2 Tom02", fileString: "set2-tom02"),
        ADOneShotSound(name: "Set2 Tom03", fileString: "set2-tom03"),
    ]

    static let master_cymbals = [
        ADOneShotSound(name: "Xe8 Crash Ext 11", fileString: "XE8 Crash ext_11"),
        ADOneShotSound(name: "Xe8 Crash Int 13", fileString: "XE8 Crash int_13"),
        ADOneShotSound(name: "Clavia Cymbal 2", fileString: "Clavia-Cymb 2"),
        ADOneShotSound(name: "Clavia Cymbal 3", fileString: "Clavia-Cymb 3"),
        ADOneShotSound(name: "Elka80 Crash", fileString: "Elka80-Crash"),
        ADOneShotSound(name: "Jxb Crash02", fileString: "JXB-Crash02"),
        ADOneShotSound(name: "Set2 Crash01", fileString: "set2-crash01"),
    ]

    static let master_ohats = [
        ADOneShotSound(name: "Xe8 Hat Open Ext 5", fileString: "XE8 Hat Open ext_5"),
        ADOneShotSound(name: "Xe8 Hat Open Int 7", fileString: "XE8 Hat Open int_7"),
        ADOneShotSound(name: "Cmd8 Hihat Open", fileString: "CMD8_Hihat_Open"),
        ADOneShotSound(name: "Elka80 Openhat", fileString: "Elka80-OpenHat"),
        ADOneShotSound(name: "Elka80 Openhat2", fileString: "Elka80-OpenHat2"),
        ADOneShotSound(name: "Emu Open Hat1", fileString: "emu-oh1"),
        ADOneShotSound(name: "Jxb Open Hat01", fileString: "JXB-Ophh01"),
        ADOneShotSound(name: "Jxb Open Hat02", fileString: "JXB-Ophh02"),
        ADOneShotSound(name: "A Linn Hat Op", fileString: "A-LinnHHOp"),
        ADOneShotSound(name: "Set2 Ohat01", fileString: "set2-ohat01"),
    ]
    
    static let master_percs = [
        ADOneShotSound(name: "XE8 block", fileString: "XE8 Block 1 ext_14"),
        ADOneShotSound(name: "XE8 clap", fileString: "XE8 Clap int_15"),
        ADOneShotSound(name: "XE8 cowbell", fileString: "XE8 Cowbell 1 ext_12"),
        ADOneShotSound(name: "TR808 cowbell", fileString: "tr-808-cowbell-01"),
        ADOneShotSound(name: "TR808 low conga", fileString: "tr-808-low-conga-01"),
        ADOneShotSound(name: "TR808 mid conga", fileString: "tr-808-mid-conga-01"),
        ADOneShotSound(name: "CMD8 clap", fileString: "CMD8_Clap"),
        ADOneShotSound(name: "CMD8 cowbell", fileString: "CMD8_Cowbell"),
        ADOneShotSound(name: "Clavia perc1", fileString: "Clavia-Perc 1"),
        ADOneShotSound(name: "Clavia perc2", fileString: "Clavia-Perc 2"),
        ADOneShotSound(name: "Clavia perc3", fileString: "Clavia-Perc 5"),
        ADOneShotSound(name: "Clavia perc4", fileString: "Clavia-Perc 6"),
        ADOneShotSound(name: "Elka80 clave", fileString: "Elka80-Clave"),
        ADOneShotSound(name: "Elka80 gator tamb", fileString: "Elka80-GatorTambourine"),
        ADOneShotSound(name: "Elka80 guiro", fileString: "Elka80-Guiro"),
        ADOneShotSound(name: "Elka80 shaker", fileString: "Elka80-Shaker2"),
        ADOneShotSound(name: "emu clap", fileString: "emu-clap1"),
        ADOneShotSound(name: "emu rim", fileString: "emu-rim1"),
        ADOneShotSound(name: "emu perc1", fileString: "emu-p1"),
        ADOneShotSound(name: "JXB rim", fileString: "JXB-Rim02"),
        ADOneShotSound(name: "DRM-1 conga1", fileString: "DRM-1 Conga2"),
        ADOneShotSound(name: "DRM-1 conga2", fileString: "DRM-1 Conga3"),
        ADOneShotSound(name: "DRM-1 timb", fileString: "DRM-1 Timb2"),
        ADOneShotSound(name: "A-Linn rim", fileString: "A-LinnRim"),
        ADOneShotSound(name: "A-Linn perc", fileString: "A-LinnPerc8"),
        ADOneShotSound(name: "Moog perc1", fileString: "moog_prc_01"),
        ADOneShotSound(name: "gen rattle", fileString: "set2-rattle"),
        ADOneShotSound(name: "gen tamb", fileString: "set2-tamb01"),
        ADOneShotSound(name: "AN200 perc1", fileString: "AN200_03"),
        ADOneShotSound(name: "AN200 perc2", fileString: "AN200_06"),
        ADOneShotSound(name: "AN200 perc3", fileString: "AN200_07"),
        ADOneShotSound(name: "AN200 perc4", fileString: "AN200_08"),
        ADOneShotSound(name: "AN200 perc5", fileString: "AN200_11"),
        ADOneShotSound(name: "AN200 perc6", fileString: "AN200_12"),
        ADOneShotSound(name: "AN200 perc7", fileString: "AN200_13"),
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
    
    func handleCustomKit(kit: [String] = []) {
        storage.updateKit(with: kit)
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
