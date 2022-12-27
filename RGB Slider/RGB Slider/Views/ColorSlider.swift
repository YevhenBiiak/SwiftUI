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
    
    @State private var text = ""
    @State private var isAlertPresented = false
    
    var body: some View {
        HStack {
            Text(String(format: "%.0f",value)).frame(width: 50)
            
            Slider(value: $value, in: 0...255, step: 1).tint(tintColor)

            TextField("\(lround(value))", text: $text)
                .frame(width: 50)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .onAppear {
                    text = "\(lround(value))"
                }
                .onSubmit {
                    if let newValue = validate(text) {
                        value = newValue
                    } else {
                        text = "\(lround(value))"
                        isAlertPresented.toggle()
                    }
                }
                .onChange(of: value) { newValue in
                    text = "\(lround(newValue))"
                }
                .alert("\(tintColor.description.capitalized) component is should be from 0 to 255", isPresented: $isAlertPresented) {
                }
        }
        .padding()
    }
    
    private func validate(_ text: String) -> Double? {
        guard let value = Double(text), (0...255).contains(value) else {
            return nil
        }
        return value
    }
}

struct ColorSlider_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var value: Double = 10
        
        var body: some View {
            ColorSlider(tintColor: .blue, value: $value)
        }
    }
        
    static var previews: some View {
        Preview()
    }
}
