//
//  PlannerApp.swift
//  Planner
//
//  Created by Yevhen Biiak on 04.01.2023.
//

import SwiftUI

@main
struct PlannerApp: App {
    
    private let noteManager = Manager(storage: Storage(of: Note.self))
    private let categoryManager = Manager(storage: Storage(of: Category.self))
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(noteManager)
                .environmentObject(categoryManager)
                .onAppear {
                    if categoryManager.data.isEmpty {
                        categoryManager.add(Category(name: "General", duration: 1 * 3600))
                    }
                }
        }
    }
}
