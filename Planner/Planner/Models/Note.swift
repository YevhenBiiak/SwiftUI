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

extension Category {
    
    static var testSet: [Category] = [
        Category(name: "home", duration: 2.5 * 3600),
        Category(name: "work", duration: 3 * 3600)
    ]
}

extension Note {
    
    static func testSet() -> [Note] {[
        Note(startTime: date(day: 6, hour: 9,  minute: 00), name: "Anna", phone: "380949503855", category: Category.testSet[0]),
        Note(startTime: date(day: 6, hour: 12, minute: 30), name: "Valentina", phone: "380949835855", category: Category.testSet[1]),
        Note(startTime: date(day: 6, hour: 16, minute: 00), name: "Megan", phone: "3800946503855", category: Category.testSet[0]),
        
        Note(startTime: date(day: 7, hour: 9,  minute: 00), name: "Olivia", phone: "380949503855", category: Category.testSet[1]),
        Note(startTime: date(day: 7, hour: 12, minute: 30), name: "Emma", phone: "380949835855", category: Category.testSet[0]),
        
        Note(startTime: date(day: 8, hour: 9,  minute: 00), name: "Amelia", phone: "380949503855", category: Category.testSet[0]),
        
        Note(startTime: date(day: 9, hour: 9,  minute: 00), name: "Isabella", phone: "380949503855", category: Category.testSet[1]),
        Note(startTime: date(day: 9, hour: 12, minute: 30), name: "Mia", phone: "380949835855", category: Category.testSet[0]),
        
        Note(startTime: date(day: 10, hour: 15, minute: 30), name: "Ocean", phone: "3800946503855", category: Category.testSet[1]),
        
        Note(startTime: date(day: 11, hour: 9,  minute: 30), name: "Ava", phone: "380949835855", category: Category.testSet[1]),
        Note(startTime: date(day: 11, hour: 13, minute: 00), name: "Sophia", phone: "3800946503855", category: Category.testSet[0]),
        Note(startTime: date(day: 11, hour: 16, minute: 30), name: "Charlotte", phone: "3800946503855", category: Category.testSet[1])
        
    ]}
    
    private static func date(year: Int = 2023, month: Int = 1, day: Int = 4, hour: Int, minute: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        return Calendar.current.date(from: dateComponents)!
    }
}

