//
//  ContentView.swift
//  Hosting UIView In SwiftUI
//
//  Created by Yevhen Biiak on 29.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var game = Game()
    @State private var sliderValue: Double = 25
    @State private var isAlertPresented: Bool = false
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.title2)
            
            HStack {
                Image(systemName: "0.square.fill")
                    .foregroundColor(.gray)
                    .font(.title2)
                
                SliderUIKit(value: $sliderValue, alpha: alpha, range: 0...50, tintColor: .black)
                    .disabled(game.status != .started)
                    
                Image(systemName: "50.square.fill")
                    .foregroundColor(.gray)
                    .font(.title2)
            }
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 50, trailing: 0))
            
            Button(action: buttonAction){
                Text(buttonTitle)
            }
            .tint(.orange)
            .buttonStyle(.borderedProminent)
            .alert("Your score: \(lround(game.score))", isPresented: $isAlertPresented) {}
        }
        .offset(x: 0, y: 12)
        .padding()
    }
    
    private var titleText: String {
        switch game.status {
        case .ready:   return "Game rules: Move the slider to target as close as you can!"
        case .started, .ended: return "Move the slider to \(lround(game.randomValue))" }
    }
    
    private var buttonTitle: String {
        game.status == .started ? "Check" : "Start game"
    }
    
    private var alpha: Double {
        guard game.status == .started else { return 1 }
        let maxOffset = max(50 - game.randomValue, game.randomValue)
        let difference = abs(sliderValue - game.randomValue)
        return 1.03 - difference / maxOffset
    }
    
    private func buttonAction() {
        switch game.status {
        case .ready:
            game.startNewGame()
        case .started:
            game.check(sliderValue)
            isAlertPresented.toggle()
        case .ended:
            game.startNewGame()
            sliderValue = 25
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
