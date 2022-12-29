//
//  UserManager.swift
//  RegistrationAndTimer
//
//  Created by Yevhen Biiak on 28.12.2022.
//

import Foundation

class UserManager: ObservableObject {
    
    private struct Keys {
        static let isUserRegistered = "isUserRegistered"
        static let userName = "userName"
    }
    
    @Published var isUserRegistered: Bool {
        didSet { save() }
    }
    @Published var userName: String
    
    var isNameValid: Bool {
        userName.count >= 3
    }
    
    init() {
        isUserRegistered = UserDefaults.standard.bool(forKey: Keys.isUserRegistered)
        userName = UserDefaults.standard.string(forKey: Keys.userName) ?? ""
    }
    
    private func save() {
        UserDefaults.standard.set(isUserRegistered, forKey: Keys.isUserRegistered)
        isUserRegistered ? UserDefaults.standard.set(userName, forKey: Keys.userName)
                         : UserDefaults.standard.removeObject(forKey: Keys.userName)
    }
}
