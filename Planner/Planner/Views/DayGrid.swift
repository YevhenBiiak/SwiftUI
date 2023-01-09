//
//  DayGrid.swift
//  Planner
//
//  Created by Yevhen Biiak on 05.01.2023.
//

import SwiftUI

struct DayGrid: View {
    
    let date: Date
    
    @EnvironmentObject var noteManager: Manager<Note>
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(times, id: \.self) { time in
                    VStack {
                        if let num = noteWichStartsWith(time) {
                            DayGridCell(time: time, fill: color(forNum: num), width: 80, rounded: .leading)
                        } else if let num = noteWichContains(time) {
                            DayGridCell(time: time, fill: color(forNum: num), width: 140, rounded: nil)
                        } else if let num = noteWichEndsWith(time) {
                            DayGridCell(time: time, fill: color(forNum: num), width: 80, rounded: .trailing)
                        } else {
                            NavigationLink("+", destination: AddNote(date: time))
                                .font(.largeTitle.weight(.medium))
                                .frame(width: 80, height: 80)
                                .disabled(filteredNotes.count == 3)
                                .foregroundColor(.accentColor)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15).stroke(.quaternary, lineWidth: 1)
                                }
                            Text("\(time.formatted("HH")):\(time.formatted("mm"))")
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(title)
    }
    
    private var title: String {
        date.formatted("d MMMM, EEEE").capitalized
    }
    
    private var times: [Date] {
        var times: [Date] = []
        for h in 7...20 {
            times.append(date.with(hour: h))
            times.append(date.with(hour: h).with(minute: 30))
        }
        return times
    }
    
    private var filteredNotes: [Note] {
        noteManager.data.filter { note in
            let currnet = (date.day, date.month, date.year)
            let start = (note.startTime.day, note.startTime.month, note.startTime.year)
            return currnet == start
        }
    }
    
    private func noteWichStartsWith(_ time: Date) -> Int? {
        var number: Int?
        for (i, note) in filteredNotes.enumerated() where note.startTime == time {
            number = i
        }
        return number
    }
    
    private func noteWichEndsWith(_ time: Date) -> Int? {
        var number: Int?
        for (i, note) in filteredNotes.enumerated() where note.startTime + note.category.duration == time {
            number = i
        }
        return number
    }
    
    private func noteWichContains(_ time: Date) -> Int? {
        var number: Int?
        for (i, note) in filteredNotes.enumerated() where note.startTime < time && time < note.startTime + note.category.duration {
            number = i
        }
        return number
    }
    
    private func color(forNum num: Int) -> Color {
        switch num {
        case 0: return .green
        case 1: return .orange
        default: return .red }
    }
}

struct DayGridCell: View {
    
    let time: Date
    let fill: Color
    let width: CGFloat
    let rounded: Edge.Set?
    
    var body: some View {
        VStack {
            if let rounded {
                Rectangle()
                    .fill(fill)
                    .frame(width: width, height: 80)
                    .padding(rounded == .trailing ? .leading : .trailing, 15)
                    .cornerRadius(15)
                    .padding(rounded == .trailing ? .leading : .trailing, -15)
            } else {
                Rectangle()
                    .fill(fill)
                    .frame(width: width, height: 80)
            }
            Text("\(time.formatted("HH")):\(time.formatted("mm"))")
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DayGrid(date: Date())
        }
    }
}
