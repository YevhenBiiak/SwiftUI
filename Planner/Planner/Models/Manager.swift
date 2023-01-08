//
//  Manager.swift
//  Planner
//
//  Created by Yevhen Biiak on 08.01.2023.
//

import Foundation

class Manager<Model: Codable & Equatable>: ObservableObject {
    
    @Published private(set) var data: [Model] = []
    
    private let storage: Storage<Model>
    
    init(storage: Storage<Model>) {
        self.storage = storage
        data = try! storage.load()
    }
    
    func add(_ model: Model) {
        data.append(model)
        try! storage.save(data)
    }
    
    func remove(_ model: Model) {
        data.removeAll { $0 == model }
    }
}
