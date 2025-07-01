//
//  ADAutechreModeEnums.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//

import Foundation

// MARK: Enum
enum ADAutechreModeCurrentPhraseOnDisplay {
    case bar16
    case bar32
    case bar48
    case bar64
    case unknown
}

// MARK: Square Type
enum ADAutechreSquareType: CustomStringConvertible {
    case kick
    case snare
    case hat
    case tom
    case ride
    case perc
    case unknown
    
    var description: String {
        switch self {
        case .kick:
            "BD"
        case .snare:
            "SN"
        case .hat:
            "CH"
        case .tom:
            "T"
        case .ride:
            "SH"
        case .perc:
            "PRC"
        case .unknown:
            "unknown"
        }
    }
}
