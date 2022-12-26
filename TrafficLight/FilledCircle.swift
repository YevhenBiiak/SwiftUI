//
//  FilledCircle.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct FilledCircle: View {
    
    var fillColor: Color
    
    var body: some View {
        Circle()
            .foregroundColor(fillColor)
            .frame(width: 100, height: 100)
            .shadow(color: .white, radius: 8)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
    }
}

struct FilledCircle_Previews: PreviewProvider {
    static var previews: some View {
        FilledCircle(fillColor: .red)
    }
}
