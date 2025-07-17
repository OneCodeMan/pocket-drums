//
//  ADArrayStorage.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-17.
//

import SwiftUI

struct ADItemWrapper: Codable, Identifiable {
    let id: UUID
    let name: String
}

class ADArrayStorage<T: Codable>: ObservableObject {
    private let key: String
    @Published var items: [T] {
        didSet {
            save()
        }
    }

    init(key: String, defaultValue: [T]) {
        self.key = key
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([T].self, from: data) {
            self.items = decoded
        } else {
            self.items = defaultValue
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
