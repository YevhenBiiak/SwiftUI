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
    @State private var duration: Double = 2
    
    var body: some View {
        VStack {
            Form {
                List {
                    ForEach(categoryManager.data) { category in
                        HStack {
                            Text(category.name)
                            Spacer()
                            Text("\(String(format: "%.1f", category.duration / 3600)) hours")
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
                HStack {
                    Text(name.isEmpty ? "New Category" : name)
                    Spacer()
                    Text("\(String(format: "%.1f", duration)) hours")
                }
                .opacity(0.2)
            }
            VStack {
                TextField("New Category", text: $name)
                    .foregroundColor(.secondary)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.tertiary.opacity(0.4))
                    }
                Slider(value: $duration, in: 0...5, step: 0.5)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.tertiary.opacity(0.4))
                    }
                Button("Create") {
                    categoryManager.add(Category(name: name, duration: duration * 3600))
                    name = ""
                }
                .fontWeight(.bold)
                .frame(height: 50)
                .padding(.horizontal)
                .disabled(name.isEmpty)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
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
    }
}
