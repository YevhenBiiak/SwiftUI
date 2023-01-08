//
//  DayPicker.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct DayPicker<Content, Label>: View where Content: View, Label: View {
    
    @Binding var selectedDate: Date
    let label: (Int) -> Label
    let content: (Date) -> Content
    
    @State private var page: Int = 1
    @State private var nextDate: Date = Date()
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(0..<3) { p in
                GeometryReader { _ in
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(weekdays, id: \.self) { weekday in
                                Text(weekday)
                            }
                            .font(.headline)
                            .opacity(0.7)
                            ForEach(days(inMonth: months[p]), id: \.self) { day in
                                VStack {
                                    if day > 0 {
                                        Button(action: {} ) {
                                            label(day)
                                        }
                                    }
                                }
                            }
                            .frame(height: 40)
                        }
                        content(months[p])
                    }
                    .onDisappear {
                        if selectedDate.month != nextDate.month {
                            selectedDate = nextDate
                            page = 1
                        }
                    }
                }
            }
        }
        .foregroundColor(.primary)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: page) { nextDate = months[$0] }
        .onChange(of: selectedDate) { nextDate = $0 }
    }
    
    private var months: [Date] {
        [selectedDate - .month, selectedDate, selectedDate + .month]
    }
    
    private let weekdays: [String] = {
        var weekdays = Calendar.current.shortWeekdaySymbols
        weekdays.append(weekdays.removeFirst())
        return weekdays
    }()

    private func days(inMonth date: Date) -> [Int] {
        let first = date.with(day: 1)
        let count = first.weekday - 2 >= 0 ? first.weekday - 2 : 5 + first.weekday
        let offset = stride(from: -count, to: 0, by: 1) + []
        return offset + date.range(of: .day, in: .month)!
    }
}

//struct DatePicker_Previews: PreviewProvider {
//
//    struct Preview: View {
//        @State private var date = Date()
//        var body: some View {
//            DayPicker(selectedDate: $date, content: {_ in VStack {} })
//        }
//    }
//
//    static var previews: some View {
//        Preview()
//    }
//}
