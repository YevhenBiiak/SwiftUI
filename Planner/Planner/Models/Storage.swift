//
//  Storage.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import Foundation

class Storage<Model: Codable> {
        
    private let defaults = UserDefaults.standard
    private lazy var key = String(reflecting: type.self)
    private let type: Model.Type
    
    init(of type: Model.Type) {
        self.type = type
    }
        
    func load() throws -> [Model] {
        let data = defaults.array(forKey: key) as? [Data] ?? []
        let models = data.compactMap { try? JSONDecoder().decode(type.self, from: $0) }
        
        return models
    }
    
    func save(_ models: [Model]) throws {
        let data = try models.compactMap { try JSONEncoder().encode($0) }
        defaults.set(data, forKey: key)
    }
}
