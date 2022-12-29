//
//  RegistrationAndTimerApp.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import SwiftUI

@main
struct RegistrationAndTimerApp: App {
    
    let userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StartingView()
                .environmentObject(userManager)
        }
    }
}
