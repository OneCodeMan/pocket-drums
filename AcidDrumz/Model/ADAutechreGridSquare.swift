//
//  ADAutechreGridSquare.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-07.
//

import Foundation

struct AutechreGridSquare: Identifiable, Equatable {
    let id = UUID()
    let barIndex: Int     // 1...64
    let row: Int          // 0...5 (BD to SH)
    let type: ADAutechreSquareType
    var isSelected: Bool
}
