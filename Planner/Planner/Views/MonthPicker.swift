//
//  MonthPicker.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

struct MonthPicker: View {
    
    @Binding var selection: Date
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(months, id: \.self) { month in
                Button {
                    selection = month
                } label: {
                    if selection == month {
                        Text(month.formatted("MMMM").capitalized)
                            .font(.title2.bold())
                            .frame(width: 120)
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.accentColor)
                            }
                    } else {
                        Text(month.formatted("MMMM"))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    private var months: [Date] {
        [selection - .month, selection, selection + .month]
    }
}

struct MonthPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        MonthPicker(selection: .constant(Date()))
    }
}
