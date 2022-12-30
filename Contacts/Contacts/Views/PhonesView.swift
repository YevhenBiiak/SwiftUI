//
//  PhonesView.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

import SwiftUI

struct PhonesView: View {
    
    let contacts: [Contact]
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                Section {
                    Label(contact.phone, systemImage: "phone.fill")
                    Label(contact.email, systemImage: "envelope.fill")
                } header: {
                    Text("\(contact.fullName)")
                        .font(.body)
                        .fontWeight(.bold)
                        .textCase(.none)
                }
            }
            .navigationTitle("Phones")
        }
    }
}

struct PhonesView_Previews: PreviewProvider {
    static var previews: some View {
        PhonesView(contacts: Contact.getContacts())
    }
}
