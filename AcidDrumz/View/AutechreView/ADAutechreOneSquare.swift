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
    
    var squareTypeToActiveColourMap: [Int: Color] = [
        ADAutechreSquareType.kick.rawValue: Color.ADAutechreKickButton,
        ADAutechreSquareType.snare.rawValue: Color.ADAutechreSnareButton,
        ADAutechreSquareType.hat.rawValue: Color.ADAutechreHatButton,
        ADAutechreSquareType.tom.rawValue: Color.ADAutechreTomButton,
        ADAutechreSquareType.perc.rawValue: Color.ADAutechrePercButton,
        ADAutechreSquareType.ride.rawValue: Color.brown,
        ADAutechreSquareType.empty.rawValue: Color.gray,
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
                if let realColour = squareTypeToActiveColourMap[squareType.rawValue] {
                    squareColour = realColour
                    print(realColour.description)
                } else {
                    print("not real colour")
                    print(squareType.rawValue)
                }
                
            }
    }
}
