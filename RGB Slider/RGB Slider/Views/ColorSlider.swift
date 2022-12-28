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
            
            TextField("", text: $text)
                .frame(width: 50)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .onAppear { text = "\(lround(value))" }
                .onSubmit(validate)
                .onChange(of: value, perform: { _ in
                    text = "\(lround(value))"
                })
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text("Wrong format!"),
                          message: Text("Please enter value from 0 to 255"))
                }
        }
        .padding()
    }
}

extension ColorSlider {
    
    private func validate() {
        if let newValue = Double(text), (0...255).contains(newValue) {
            self.value = newValue
        } else {
            self.text = "\(lround(value))"
            isAlertPresented.toggle()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
        
    static var previews: some View {
        ColorSlider(tintColor: .blue, value: .constant(50))
    }
}
