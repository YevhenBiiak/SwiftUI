//
//  ColorSlider.swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import SwiftUI

struct ColorSlider: View {
    
    let tintColor: Color
    
    @Binding var value: Double
    
    @State private var isAlertPresented = false
    
    var body: some View {
        HStack {
            Text(String(format: "%.0f",value)).frame(width: 50)
            
            Slider(value: $value, in: 0...255, step: 1).tint(tintColor)
            
            TextField("\(lround(value))", value: $value, format: .number)
                .frame(width: 50)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .onSubmit(validate)
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text("Wrong format!"),
                          message: Text("Please enter value from 0 to 255"))
                }
        }
        .padding()
    }
    
    private func validate() {
        if !(0...255).contains(value) {
            value = value < 128 ? 0 : 255
            isAlertPresented.toggle()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var value: Double = 255
        
        var body: some View {
            ColorSlider(tintColor: .blue, value: $value)
        }
    }
        
    static var previews: some View {
        Preview()
    }
}
