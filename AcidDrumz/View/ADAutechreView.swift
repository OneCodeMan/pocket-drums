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

struct ADAutechreView: View {
    // 16 for 4 bars; 1 for labeling very left
    let columns = Array(repeating: GridItem(.flexible()), count: 17)
    let rows = Array(repeating: GridItem(.fixed(30)), count: 7)
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: rows) {
                ForEach(0...16, id: \.self) { item in
                    // TODO: refactor to own class: "ADAutechreOneSquare"
                    RoundedRectangle(cornerRadius: 2.0)
                        .fill(Color.gray)
                        .frame(width: 35, height: 35)
                    
                }
            }
        }
    }
}
