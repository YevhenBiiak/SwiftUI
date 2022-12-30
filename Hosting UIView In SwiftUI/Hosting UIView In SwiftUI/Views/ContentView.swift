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
        }
        .offset(x: 0, y: 12)
        .padding()
    }
    
    private var titleText: String {
        switch game.status {
        case .ready:   return "Game rules: Move the slider to target as close as you can!"
        case .started: return "Move the slider to \(lround(game.randomValue))"
        case .ended:   return "Your score: \(lround(game.score))" }
    }
    
    private var alpha: Double {
        guard game.status == .started else { return 1 }
        let maxOffset = max(50 - game.randomValue, game.randomValue)
        let difference = abs(sliderValue - game.randomValue)
        return 1.03 - difference / maxOffset
    }
    
    private var buttonTitle: String {
        game.status == .started ? "Check" : "Start game"
    }
    
    private func buttonAction() {
        if game.status == .started {
            game.check(sliderValue)
        } else {
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
