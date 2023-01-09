//
//  ContentView.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var noteManager: Manager<Note>
    
    @State private var selectedDate = Date.midnight
    
    var body: some View {
        NavigationStack {
            VStack {
                MonthPicker(selection: $selectedDate)
                    .padding(.vertical)
                DayPicker(selectedDate: $selectedDate) { date in
                    DayCell(date: date, isSelected: selectedDate == date)
                } content: { date in
                    NoteList(date: date)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
            .toolbar(content: toolbarContent)
        }
    }
    
    private var title: String {
        "Planner \(selectedDate.formatted("yyyy"))"
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem {
            NavigationLink {
                Categories()
            } label: {
                Image(systemName: "list.bullet")
                    .fontWeight(.bold)
            }
        }
    }
}

struct DayCell: View {
    
    @EnvironmentObject var noteManager: Manager<Note>
    
    let date: Date
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Indicator(count: filteredNotes.count)
                .frame(height: 12)
                .opacity(isSelected ? 1 : 0.5)
        }
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(.tertiarySystemGroupedBackground))
        }
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(.primary, lineWidth: isSelected ? 1 : 0)
            Text("\(date.day)")
        }
        .scaleEffect(isSelected ? 1.2 : 1)
        .animation(.spring(), value: isSelected)
    }
    
    private var filteredNotes: [Note] {
        noteManager.data.filter { note in
            let currnet = (date.day, date.month, date.year)
            let start = (note.startTime.day, note.startTime.month, note.startTime.year)
            return currnet == start
        }
    }
    
    struct Indicator: View {
        
        let count: Int
        
        var body: some View {
            switch count {
            case 1:
                HStack(spacing: 0) {
                    Rectangle().fill(.green)
                    Rectangle().fill(.clear)
                    Rectangle().fill(.clear)
                }
            case 2:
                HStack(spacing: 0) {
                    Rectangle().fill(.orange)
                    Rectangle().fill(.orange)
                    Rectangle().fill(.clear)
                }
            case 3:
                HStack(spacing: 0) {
                    Rectangle().fill(.red)
                    Rectangle().fill(.red)
                    Rectangle().fill(.red)
                }
            default:
                Rectangle().fill(.clear)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
