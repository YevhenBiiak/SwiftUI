//
//  NoteList.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct NoteList: View {
    
    let date: Date
    
    @EnvironmentObject var noteManager: Manager<Note>
    
    var body: some View {
        VStack {
            HStack {
                Text(date.formatted("d MMMM, EEEE").capitalized)
                    .font(.headline)
                Spacer()
                NavigationLink {
                    DayGrid(date: date)
                } label: {
                    Image(systemName: "rectangle.grid.2x2.fill")
                        .font(.title2)
                        .padding(.trailing, 3)
                        .foregroundColor(.accentColor.opacity(0.9))
                }
            }
            .padding(.trailing)
            
            ScrollView(.vertical) {
                ForEach(filteredNotes) { note in
                    NoteRow(note: note)
                        .frame(height: 60)
                        .padding(.trailing)
                }
                if filteredNotes.count < 3 {
                    AddNoteRow(date: date)
                        .frame(height: 60)
                        .padding(.trailing)
                }
            }
        }
        .padding(.leading)
    }
    
    private var filteredNotes: [Note] {
        noteManager.data.filter { note in
            let currnet = (date.day, date.month, date.year)
            let start = (note.startTime.day, note.startTime.month, note.startTime.year)
            return currnet == start
        }
    }
}

struct NoteRow: View {
    
    let note: Note
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink {
                NoteDetails(note: note)
            } label: {
                VStack(alignment: .leading) {
                    Text(timeText)
                        .font(.footnote)
                    Spacer()
                    Text(note.category.name.lowercased())
                        .foregroundColor(.accentColor)
                        .font(.callout)
                        .offset(y: -1)
                        .padding(.horizontal, 4)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3).stroke(Color.accentColor, lineWidth: 2)
                        }
                }
                Spacer()
                Text(note.name)
                    .padding(.trailing, 12)
                Image(systemName: "iphone")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.accentColor.opacity(0.7))
                    }
            }
            .padding()
            .foregroundColor(.black)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
            }
            .transition(.slide)
        }
    }
    
    private var timeText: String {
        "\(note.startTime.formatted("HH:mm")) - \((note.startTime + note.category.duration).formatted("HH:mm"))"
    }
}

struct AddNoteRow: View {
    
    let date: Date
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink {
                DayGrid(date: date)
            } label: {
                Label("Add Note", systemImage: "plus")
                    .padding()
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                    }
            }
        }
    }
}


struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList(date: Date())
    }
}
