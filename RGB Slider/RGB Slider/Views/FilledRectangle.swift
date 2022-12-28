//
//  FilledRectangle.swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import SwiftUI

struct FilledRectangle: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red/255, green: green/255, blue: blue/255)
            .frame(height: 200)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 15).stroke(Color(.white), lineWidth: 4)
            }
            .padding()
    }
}

struct FilledRectangle_Previews: PreviewProvider {
    static var previews: some View {
        FilledRectangle(red: 12, green: 34, blue: 244)
    }
}
