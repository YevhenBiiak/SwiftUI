//
//  TimeCounter.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    
    enum State { case ready, started, stopped }
    
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var counter = 3
    var state = State.ready
    
    private var timer: Timer?
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] time in
            self?.updateCounter()
        }
        state = .started
        objectWillChange.send(self)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        state = .stopped
        objectWillChange.send(self)
    }
    
    func restart() {
        counter = 3
        state = .ready
        objectWillChange.send(self)
    }
    
    private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            stop()
        }
        
        objectWillChange.send(self)
    }
}
