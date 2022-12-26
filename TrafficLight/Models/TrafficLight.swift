//
//  TrafficLight.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

struct TrafficLight {
    
    enum Light { case red, yellow, green }
    
    var current: Light?
    
    mutating func nextColor() {
        switch current {
        case .red:    current = .yellow
        case .yellow: current = .green
        case .green:  current = .red
        case .none:   current = .red }
    }
}
