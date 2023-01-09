//
//  Note.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import Foundation

struct Note: Identifiable, Hashable, Codable {
    var id = UUID()
    let startTime: Date
    let name: String
    let phone: String
    let category: Category
}

struct Category: Identifiable, Hashable, Codable {
    var id = UUID()
    let name: String
    let duration: TimeInterval
}
