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
enum ADAutechreSquareType: Int, CustomStringConvertible {
    case kick = 1
    case snare = 2
    case hat = 3
    case tom = 4
    case ride = 5
    case perc = 6
    case empty = 0
    
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
        case .empty:
            "unknown"
        }
    }
}
