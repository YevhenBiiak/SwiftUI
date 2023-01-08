//
//  AddNote.swift
//  Planner
//
//  Created by Yevhen Biiak on 08.01.2023.
//

import SwiftUI

struct AddNote: View {
    
    let date: Date
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var noteManager: Manager<Note>
    @EnvironmentObject var categoryManager: Manager<Category>
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var category = Category(name: "", duration: 0)
    
    var body: some View {
        Form {
            Row(text: "Name:", systemImage: "person.fill") {
                TextField("Name", text: $name)
                    .multilineTextAlignment(.trailing)
            }
            Row(text: "Phone:", systemImage: "iphone") {
                TextField("Phone", text: $phone)
                    .multilineTextAlignment(.trailing)
            }
            Row(text: "Start time:", systemImage: "clock.fill") {
                Text(date.formatted("H:mm").capitalized)
            }
            Row(text: "Duration:", systemImage: "timer") {
                Text("\(String(format: "%.1f",category.duration / 3600)) hours")
            }
            Row(text: "Category:", systemImage: "tag.fill") {
                Picker("", selection: $category) {
                    ForEach(categoryManager.data) { category in
                        Text(category.name)
                            .tag(category)
                    }
                }
            }
        }
        .navigationTitle(title)
        .toolbar(content: toolbarContent)
        .onAppear {
            category = categoryManager.data.first!
        }
    }
    
    private var title: String {
        date.formatted("d MMMM, EEEE").capitalized
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem {
            Button("Save") {
                noteManager.add(Note(startTime: date, name: name, phone: phone, category: category))
                dismiss()
            }
            .fontWeight(.bold)
            .padding(.trailing, 4)
            .disabled(name.isEmpty || Int(phone) == nil)
        }
    }
    
    @ViewBuilder
    func Row<Content>(text: String, systemImage: String, content: () -> Content) -> some View where Content: View {
        HStack {
            Image(systemName: systemImage)
                .foregroundStyle(Color.accentColor)
            Text(text)
            Spacer()
            content()
        }
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote(date: Date())
    }
}
