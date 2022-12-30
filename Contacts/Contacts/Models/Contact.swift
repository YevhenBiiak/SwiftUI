//
//  Contact.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

import Foundation

struct Contact: Identifiable {
    
    var id = UUID()
    let name: String
    let surname: String
    let email: String
    let phone: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Contact {
    static func getContacts() -> [Contact] {
        
        var persons: [Contact] = []
        
        var names = DataManager.shared.names.shuffled()
        var surnames = DataManager.shared.surnames.shuffled()
        var emails = DataManager.shared.emails.shuffled()
        var phones = DataManager.shared.phones.shuffled()
         
        while !names.isEmpty {
            let person = Contact(
                name:    names.removeFirst(),
                surname: surnames.removeFirst(),
                email:   emails.removeFirst(),
                phone:   phones.removeFirst()
            )
            
            persons.append(person)
        }
        
        return persons
    }
}
