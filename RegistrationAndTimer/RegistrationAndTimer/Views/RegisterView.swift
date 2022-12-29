//
//  RegisterView.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            TextField("Type your name", text: $userManager.userName)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .onSubmit(register)
            
            ProgressView(value: progress, total: 3)
                .offset(x: 0, y: -8)
                .tint(.green)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
            
            Button(action: register) {
                Text("REGISTER")
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color.white)
                    .background { buttonBGColor }
                    .cornerRadius(15)
                    .font(.title2)
            }
            .disabled(!userManager.isNameValid)
        }
        .padding()
    }
    
    private var progress: Double {
        min(Double(userManager.userName.count), 3)
    }
    
    private var buttonBGColor: Color {
        userManager.isNameValid ? Color(.systemGreen) : Color(.systemGray5)
    }
    
    private func register() {
        userManager.isUserRegistered = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
