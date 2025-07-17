//
//  ADMasterSampsListView.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-17.
//


/*
 Selection master lists
 */
import SwiftUI

struct ADMasterSampsListView: View {
    var title: String = "Kicks"
    var samps: [ADOneShotSound]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 4)
            
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(samps, id: \.self) { item in
                    Text(item.name)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

