//
//  FilledButton.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct FilledButton: View {
    
    let fillColor: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 200, height: 50)
                .background { fillColor }
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: .white, radius: 8)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white ,lineWidth: 4)
                }
        }
    }
}

struct FilledRectangle_Previews: PreviewProvider {
    static var previews: some View {
        FilledButton(fillColor: .green, title: "Next", action: {})
    }
}
