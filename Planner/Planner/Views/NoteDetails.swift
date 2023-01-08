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
    
    var body: some View {
        Form {
            row(text: "Name:", systemImage: "person.fill", value: "\(note.name)")
            row(text: "Phone:", systemImage: "iphone", value: "\(note.phone)")
            row(text: "Start time:", systemImage: "clock.fill", value: "\(note.startTime.formatted("H:mm"))")
            row(text: "Duration:", systemImage: "timer", value: "\(note.category.duration / 3600)")
            row(text: "Category:", systemImage: "tag.fill", value: "\(note.category.name)")
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
                noteManager.remove(note)
                dismiss()
            }
            .foregroundColor(.red)
            .fontWeight(.bold)
            .padding(.trailing, 4)
        }
    }
    
    @ViewBuilder
    func row(text: String, systemImage: String, value: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundStyle(Color.accentColor)
            Text(text)
            Spacer()
            Text(value)
        }
    }
}

struct NoteDetails_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetails(note: Note.testSet().first!)
    }
}
