//
//  ContentView.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var noteManager: Manager<Note>
    
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                MonthPicker(selection: $selectedDate)
                    .padding(.vertical)
                DayPicker(selectedDate: $selectedDate) { day in
                    DayCell(day: day, isSelected: selectedDate.day == day) {
                        selectedDate.set(day: day)
                    }
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
    
    let day: Int
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            if isSelected {
                Button("\(day)") {
                    action()
                }
                .buttonStyle(.bordered)
            } else {
                Button("\(day)") {
                    action()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
