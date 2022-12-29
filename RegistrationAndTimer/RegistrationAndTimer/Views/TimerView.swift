//
//  TimerView.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import SwiftUI

struct TimerView: View {

    @EnvironmentObject var userManager: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Spacer()
            Text("HI, \(userManager.userName.uppercased())")
            Text("\(timer.counter)")
                .font(.title)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 70, trailing: 0))
            Button(action: timerButtonAction) {
                Text(buttonTitel)
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .background { Color.blue }
                    .cornerRadius(15)
                    .font(.title2)
            }
            Spacer()
            Spacer()
            Button(action: logout) {
                Text("LOGOUT")
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .background { Color.red }
                    .cornerRadius(15)
                    .font(.title2)
            }
        }
    }
        
    private var buttonTitel: String {
        switch timer.state {
        case .ready:   return "START"
        case .started: return "STOP"
        case .stopped: return "RESTART" }
    }
    
    private func timerButtonAction() {
        switch timer.state {
        case .ready:   timer.start()
        case .started: timer.stop()
        case .stopped: timer.restart() }
    }
    
    private func logout() {
        userManager.userName = ""
        userManager.isUserRegistered = false
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
