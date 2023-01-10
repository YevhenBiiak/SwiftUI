//
//  NoteDetails.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct NoteDetails: View {
    
    let note: Note
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var noteManager: Manager<Note>
    
    @State private var showDeleteDialog: Bool = false
    
    var body: some View {
        Form {
            Row(text: "Name:", systemImage: "person.fill", value: "\(note.name)")
            Row(text: "Phone:", systemImage: "iphone", value: "\(note.phone)", valueColor: .accentColor)
                .onTapGesture {
                    call()
                }
            Row(text: "Start time:", systemImage: "clock.fill", value: "\(note.startTime.formatted("H:mm"))")
            Row(text: "Duration:", systemImage: "timer", value: note.category.duration.timeDescription)
            Row(text: "Category:", systemImage: "tag.fill", value: "\(note.category.name)")
        }
        .navigationTitle(title)
        .toolbar(content: toolbarContent)
    }
    
    private var title: String {
        note.startTime.formatted("d MMMM, EEEE").capitalized
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem {
            Button("Delete") {
                showDeleteDialog.toggle()
            }
            .foregroundColor(.red)
            .fontWeight(.bold)
            .padding(.trailing, 4)
            .confirmationDialog("Are you sure you want to delete tish note?", isPresented: $showDeleteDialog) {
                Button("Delete note", role: .destructive) {
                    noteManager.remove(note)
                    dismiss()
                }
            }
        }
    }
    
    @ViewBuilder
    func Row(text: String, systemImage: String, value: String, valueColor: Color = .primary) -> some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundStyle(Color.accentColor)
            Text(text)
            Spacer()
            Text(value)
                .foregroundColor(valueColor)
        }
    }
    
    func call() {
        guard let url = URL(string: "tel://\(note.phone)") else { return }
        UIApplication.shared.open(url)
    }
}

struct NoteDetails_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetails(
            note: Note(startTime: Date.now, name: "Anna", phone: "380934424242", category: Category(name: "general", duration: 3600))
        )
    }
}
