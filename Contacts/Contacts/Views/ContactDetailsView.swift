//
//  ContactDetailsView.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

import SwiftUI

struct ContactDetailsView: View {
    
    let contact: Contact
    
    var body: some View {
        Form {
            Image(systemName: "person.fill")
                .resizable()
                .padding(50)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
            Label(contact.phone, systemImage: "phone.fill")
            Label(contact.email, systemImage: "envelope.fill")
        }
        .navigationTitle(contact.fullName)
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact: Contact.getContacts().first!)
    }
}
