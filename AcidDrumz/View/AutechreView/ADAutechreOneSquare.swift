//
//  ADAutechreOneSquare.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//

import SwiftUI

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
