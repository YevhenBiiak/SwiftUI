//
//  ContentView.swift
//  Contacts
//
//  Created by Yevhen Biiak on 30.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ContactsView(contacts: Contact.getContacts())
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Contacts")
                }
            PhonesView(contacts: Contact.getContacts())
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Phones")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
