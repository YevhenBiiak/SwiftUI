//
//  TrafficLightModel.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct TrafficLightModel {
    
    var red:    Color { return index == 0 ? colors.red    : colors.red.opacity(0.2) }
    var orange: Color { return index == 1 ? colors.orange : colors.orange.opacity(0.2) }
    var green:  Color { return index == 2 ? colors.green  : colors.green.opacity(0.2) }
    
    private var index: Int = 0
    private var colors: (red: Color, orange: Color, green: Color) = (
        Color(red: 1, green: 0, blue: 0),
        Color(red: 1, green: 0.75, blue: 0),
        Color(red: 0, green: 1, blue: 0))
    
    mutating func next() {
        index = index < 2 ? index + 1 : 0
    }
}
