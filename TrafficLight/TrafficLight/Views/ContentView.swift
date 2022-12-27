//
//  ContentView.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var trafficLight = TrafficLight()
    
    var body: some View {
        
        ZStack {
            Color(.black).ignoresSafeArea()
            
            VStack {
                FilledCircle(fillColor: .red,    opacity: trafficLight.current == .red    ? 1 : 0.2)
                FilledCircle(fillColor: .yellow, opacity: trafficLight.current == .yellow ? 1 : 0.2)
                FilledCircle(fillColor: .green,  opacity: trafficLight.current == .green  ? 1 : 0.2)
                Spacer()
                FilledButton(fillColor: .green, title: buttonTitle) {
                    buttonTitle = "NEXT"
                    trafficLight.nextColor()
                }
            }
            .padding(EdgeInsets(
                top: 100,
                leading: 0,
                bottom: 150,
                trailing: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
