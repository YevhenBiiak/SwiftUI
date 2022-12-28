//
//  ContentView.swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue:   Double = Double.random(in: 0...255).rounded()
    @State private var greenValue: Double = Double.random(in: 0...255).rounded()
    @State private var blueValue:  Double = Double.random(in: 0...255).rounded()

   @State var hex = ""
        
    var body: some View {
        ZStack {
            Color({#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)}()).ignoresSafeArea()
            
            VStack {
                FilledRectangle(red: redValue, green: greenValue, blue: blueValue)
                ColorSlider(tintColor: .red,   value: $redValue)
                ColorSlider(tintColor: .green, value: $greenValue)
                ColorSlider(tintColor: .blue,  value: $blueValue)
                Spacer()
            }
        }
        .onTapGesture(perform: UIApplication.shared.hideKeyboard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
