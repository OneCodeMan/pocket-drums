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
    let labels: [String] = ["BD", "SN", "CH", "OH", "T", "SH"].reversed()
    let columns = Array(repeating: GridItem(.flexible()), count: 16)
    let rows = Array(repeating: GridItem(.fixed(30)), count: 6)
    
    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 5, verticalSpacing: 5) {
            ForEach(0..<rows.count) { row in
                GridRow {
                    // very first column is the label
                    Text(labels[row])
                        .gridCellAnchor(.center)
                    ForEach(1..<17) {
                        _ in
                        let currentRow = labels[row]
                        if currentRow == "BD" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.kick)
                        }
                        
                        if currentRow == "SN" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.snare)
                        }
                        
                        if currentRow == "CH" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.hat)
                        }
                        
                        if currentRow == "OH" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.hat)
                        }
                        
                        if currentRow == "T" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.tom)
                        }
                        
                        if currentRow == "SH" {
                            ADAutechreOneSquare(squareType: ADAutechreSquareType.perc)
                        }
                        
                    }
                }
            }
            
            
        }
    }
}

// MARK: Individual square view
struct ADAutechreOneSquare: View {
    
    @State var isSelected: Bool = false
    @State var squareType: ADAutechreSquareType
    @State var squareColour: Color = .brown
    
    var squareTypeToActiveColourMap: [ADAutechreSquareType: Color] = [
        ADAutechreSquareType.kick: Color.ADOneShotHangoverPinkTapState,
        ADAutechreSquareType.snare: Color.ADOneShotGreenTapState,
        ADAutechreSquareType.hat: Color.ADOneShotGambogeTapState,
        ADAutechreSquareType.tom: Color.ADOneShotSoirBleuTapState,
        ADAutechreSquareType.perc: Color.ADOneShotDiscoVioletTapState,
        ADAutechreSquareType.ride: Color.brown,
        ADAutechreSquareType.unknown: Color.brown,
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2.0)
            .fill(isSelected ? squareColour : Color.ADAutechreModeInactiveSquare)
            .frame(width: 35, height: 35)
            .onTapGesture {
                print("tapped")
                isSelected.toggle()
            }
            .task {
                if let realColour = squareTypeToActiveColourMap[squareType] {
                    squareColour = realColour
                }
                
            }
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
