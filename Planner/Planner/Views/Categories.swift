//
//  Categories.swift
//  Planner
//
//  Created by Yevhen Biiak on 08.01.2023.
//

import SwiftUI

struct Categories: View {
    
    @EnvironmentObject var categoryManager: Manager<Category>
    
    @State private var name: String = ""
    @State private var duration: Double = 1.5
    @State private var showCreator: Bool = false
    
    private let durations = Array(stride(from: 0.5, through: 5, by: 0.5))
    
    var body: some View {
        VStack {
            Form {
                List {
                    ForEach(categoryManager.data) { category in
                        HStack {
                            Text(category.name)
                            Spacer()
                            Text(category.duration.timeDescription)
                        }
                    }
                    .onDelete { indexSet in
                        if let i = indexSet.first, categoryManager.data.count > i {
                            let category = categoryManager.data[i]
                            categoryManager.remove(category)
                        }
                    }
                    .deleteDisabled(categoryManager.data.count == 1)
                }
                if showCreator {
                    HStack {
                        Text(name.isEmpty ? "New Category" : name)
                        Spacer()
                        Text((duration * 3600).timeDescription)
                    }
                    .opacity(0.2)
                } else {
                    HStack {
                        Spacer()
                        Button(showCreator ? "Create" : "+ Add Category") {
                            withAnimation {
                                showCreator.toggle()
                            }
                        }
                        .fontWeight(showCreator ? .bold : .regular)
                        Spacer()
                    }
                }
            }
            if showCreator {
                VStack {
                    HStack {
                        Button("Cancel") {
                            name = ""
                            withAnimation {
                                showCreator.toggle()
                            }                        }
                        Spacer()
                        Button("Create") {
                            categoryManager.add(Category(name: name, duration: duration * 3600))
                            name = ""
                            withAnimation {
                                showCreator.toggle()
                            }
                        }
                        .disabled(name.isEmpty)
                    }
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                    TextField("Type the name", text: $name)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.tertiary.opacity(0.4))
                        }
                    Picker("duration", selection: $duration) {
                        ForEach(durations, id: \.self) { duration in
                            Text((duration * 3600).formattedTime)
                                .tag(duration)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(title)
    }
    
    private var title: String {
        "Categories"
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
            .environmentObject(Manager(storage: Storage(of: Category.self)))
    }
}
