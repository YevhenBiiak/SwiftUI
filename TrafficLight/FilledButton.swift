//
//  FilledButton.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct FilledButton: View {
    
    var fillColor: Color
    var title: String
    var completion: (() -> Void)? = nil
    
    var body: some View {
        Button() {
            completion?()
        } label: {
            Text(title)
                .font(.title)
                .frame(width: 200, height: 50)
                .background { fillColor }
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
        FilledButton(fillColor: .green, title: "Next")
    }
}
