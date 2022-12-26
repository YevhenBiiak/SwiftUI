//
//  ContentView.swift
//  TrafficLight
//
//  Created by Yevhen Biiak on 26.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var buttonTitle = "START"
    @State var model = TrafficLightModel()
    
    var body: some View {
        
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                FilledCircle(fillColor: model.red)
                FilledCircle(fillColor: model.orange)
                FilledCircle(fillColor: model.green)
                Spacer()
                FilledButton(fillColor: .green, title: buttonTitle) {
                    buttonTitle = "NEXT"
                    model.next()
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
