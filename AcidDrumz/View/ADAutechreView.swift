//
//  ADAutechreView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

/**
 grid of 16 cols like those Captain Pikant vids
 */

import SwiftUI

// MARK: Autechre View
struct ADAutechreView: View {
    // 16 for 4 bars; 1 for labeling very left
    let labels: [String] = [""]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let rows = Array(repeating: GridItem(.fixed(30)), count: 5)
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: rows) {
                ForEach(0...16, id: \.self) { item in
                    ADAutechreOneSquare()
                    
                }
            }
        }
    }
}

// MARK: Individual square view
struct ADAutechreOneSquare: View {
    
    @State var isSelected: Bool = false
    @State var squareType: ADAutechreSquareType = .unknown
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2.0)
            .fill(isSelected ? Color.ADOneShotGreenTapState : Color.ADAutechreModeInactiveSquare)
            .frame(width: 35, height: 35)
    }
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
            "kick"
        case .snare:
            "snare"
        case .hat:
            "hat"
        case .tom:
            "tom"
        case .ride:
            "ride"
        case .perc:
            "perc"
        case .unknown:
            "unknown"
        }
    }
}
