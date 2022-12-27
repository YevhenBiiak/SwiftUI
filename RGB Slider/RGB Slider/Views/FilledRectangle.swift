//
//  FilledRectangle.swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import SwiftUI

struct FilledRectangle: View {
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 200)
            .foregroundColor(color)
            .overlay {
                RoundedRectangle(cornerRadius: 15).stroke(Color(.white), lineWidth: 4)
            }
            .padding(16)
    }
}

struct FilledRectangle_Previews: PreviewProvider {
    static var previews: some View {
        FilledRectangle(color: .blue)
    }
}
