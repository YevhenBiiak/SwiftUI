//
//  Game.swift
//  Hosting UIView In SwiftUI
//
//  Created by Yevhen Biiak on 29.12.2022.
//

import Combine

class Game: ObservableObject {
    
    enum Status { case ready, started, ended }
    
    @Published var score: Double = 0
    @Published var randomValue: Double = 0
    @Published var status: Status = .ready
    
    func check(_ value: Double) {
        status = .ended
        score = computeScore(value)
    }
    
    func startNewGame() {
        randomValue = Double.random(in: 0...50)
        status = .started
    }
    
    private func computeScore(_ value: Double) -> Double {
        return 50 - abs(value - randomValue)
    }
}

