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
    
    @State var bpm: Double = 128.0
    
    var body: some View {
        Group {
            // MARK: Cook grid
            Grid(alignment: .bottom, horizontalSpacing: 5, verticalSpacing: 5) {
                GridRow {
                    ForEach(0..<17) { i in
                        Text("\(i)")
                            .opacity(i > 0 ? 1.0 : 0.0)
                    }
                }
                ForEach(0..<6) { row in
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
            
            // MARK: Buttons
            Group {
                HStack {
                    Button {
                        print("play pressed")
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.ADAutechrePlayButton)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.clear)
                    
                    Text("BPM: \(bpm, specifier: "%.2f")")
                }
                
            }
            .padding()
        }
        
    }
}

// MARK: Individual square view
struct ADAutechreOneSquare: View {
    
    @State var isSelected: Bool = false
    @State var squareType: ADAutechreSquareType
    @State var squareColour: Color = .brown
    
    var squareTypeToActiveColourMap: [ADAutechreSquareType: Color] = [
        ADAutechreSquareType.kick: Color.ADAutechreKickButton,
        ADAutechreSquareType.snare: Color.ADAutechreSnareButton,
        ADAutechreSquareType.hat: Color.ADAutechreHatButton,
        ADAutechreSquareType.tom: Color.ADAutechreTomButton,
        ADAutechreSquareType.perc: Color.ADAutechrePercButton,
        ADAutechreSquareType.ride: Color.brown,
        ADAutechreSquareType.unknown: Color.brown,
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2.0)
            .fill(isSelected ? squareColour : Color.ADAutechreModeInactiveSquare)
            .frame(width: 35, height: 35)
            .onTapGesture {
                print("tapped \(squareType.description)")
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
