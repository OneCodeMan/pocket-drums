//
//  ADAutechreGridViewModel.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-09.
//

import Foundation

// TODO: how do we set the beat grid?

final class ADAutechreGridViewModel: ObservableObject {
    @Published var beatGrid: [[Int]] = Array.init(repeating: [0, 0, 0, 0,
                                                              0, 0, 0, 0,
                                                              0, 0, 0, 0,
                                                              0, 0, 0, 0], count: 16)
    @Published var bar16: [[Int]] = [[]]
    @Published var bar32: [[Int]] = [[]]
    @Published var bar48: [[Int]] = [[]]
    @Published var bar64: [[Int]] = [[]]
    
    init() {
        print(beatGrid.count)
        self.bar16 = Array(beatGrid.prefix(4))
        self.bar32 = Array(beatGrid[4..<8])
        self.bar48 = Array(beatGrid[8..<12])
        self.bar64 = Array(beatGrid[12..<16])
    }
    
    // T
    func onPlayPressed() {
        print("play pressed")
        
    }
    
    func flatBar(from bar: [[Int]]) -> [Int] {
        return bar.flatMap { $0 }
    }
    
    
}
