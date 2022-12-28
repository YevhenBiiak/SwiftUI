//
//  StartingView.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import SwiftUI

struct StartingView: View {
    
    @StateObject private var userManager = UserManager()
    
    var body: some View {
        Group {
            if userManager.isUserRegistered {
                TimerView().environmentObject(userManager)
            } else {
                RegisterView().environmentObject(userManager)
            }
        }
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
