//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        
        let toDoStore: ToDoStore = ToDoStore()
        
        WindowGroup {
            ContentView(isShowingSheet: .constant(true))
                .environmentObject(toDoStore)
        }
    }
}
