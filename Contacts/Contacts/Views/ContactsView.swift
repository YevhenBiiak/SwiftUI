//
//  ContactsView.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

import SwiftUI

struct ContactsView: View {
    
    let contacts: [Contact]
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                NavigationLink(destination: ContactDetailsView(contact: contact)) {
                    Text(contact.fullName)
                }
            }
            .navigationTitle("Contacts")
        }
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView(contacts: Contact.getContacts())
    }
}
