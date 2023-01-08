//
//  Date + .swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import Foundation

extension Date {
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }
    
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    func range(of smaller: Calendar.Component, in larger: Calendar.Component) -> Range<Int>? {
        Calendar.current.range(of: smaller, in: larger, for: self)
    }
    
    func formatted(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func with(day: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.day = day
        return Calendar.current.date(from: dateComponents)!
    }
    
    func with(hour: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.day = self.day
        dateComponents.hour = hour
        return Calendar.current.date(from: dateComponents)!
    }
    
    func with(minute: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.day = self.day
        dateComponents.hour = self.hour
        dateComponents.minute = minute
        return Calendar.current.date(from: dateComponents)!
    }
    
    mutating func set(day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.day = day
        self = Calendar.current.date(from: dateComponents)!
    }
    
    static func - (left: Date, right: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: right, value: -1, to: left)!
    }
    
    static func + (left: Date, right: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: right, value: 1, to: left)!
    }
}
