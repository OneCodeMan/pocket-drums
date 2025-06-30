//
//  ADWorkMode.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

import Foundation

enum ADWorkMode: CustomStringConvertible {
    case ADSquarepusherMode
    case ADAutechreMode
    
    var description: String {
        switch self {
        case .ADSquarepusherMode:
            return "Squarepusher"
        case .ADAutechreMode:
            return "Autechr"
        }
    }
    
}
