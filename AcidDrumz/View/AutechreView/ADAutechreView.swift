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
    
    @State private var currentPhraseOnDisplay: ADAutechreModeCurrentPhraseOnDisplay = .bar16
    
    @State var bpm: Double = 128.0
    
    var body: some View {
        Group {
            // MARK: Cook grid
            Grid(alignment: .bottom, horizontalSpacing: 5, verticalSpacing: 5) {
                
                switch currentPhraseOnDisplay {
                case .bar16:
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
                case .bar32:
                    GridRow {
                        ForEach(18..<35) { i in
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
                case .bar48:
                    GridRow {
                        ForEach(36..<50) { i in
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
                case .bar64:
                    GridRow {
                        ForEach(51..<67) { i in
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
                case .unknown:
                    EmptyView()
                }
                
                
            }
            
            // MARK: Buttons
            Group {
                
                // MARK: which phrase is on current display
                VStack {
                    HStack {
                        Button {
                            print("16barz pressed")
                        } label: {
                            Text("16")
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        
                        Button {
                            print("32barz pressed")
                        } label: {
                            Text("32")
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                    }
                    
                    HStack {
                        Button {
                            print("48barz pressed")
                        } label: {
                            Text("48")
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        
                        Button {
                            print("64barz pressed")
                        } label: {
                            Text("64")
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                    }
                }
                
                // MARK: play/bpm
                HStack {
                    Button {
                        // TODO: Convert inputs to Sonic Pi-esque arrays
                        // translate to sound using timer
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
