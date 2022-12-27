//
//  ContentView.swift
//  RGB Slider
//
//  Created by Yevhen Biiak on 27.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red:   Double = Double.random(in: 0...255)
    @State private var green: Double = Double.random(in: 0...255)
    @State private var blue:  Double = Double.random(in: 0...255)
        
    var body: some View {
        ZStack {
            Color({#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)}()).ignoresSafeArea()
            
            VStack {
                FilledRectangle(color: Color(red: red/255, green: green/255, blue: blue/255))
                ColorSlider(tintColor: .red,   value: $red)
                ColorSlider(tintColor: .green, value: $green)
                ColorSlider(tintColor: .blue,  value: $blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
