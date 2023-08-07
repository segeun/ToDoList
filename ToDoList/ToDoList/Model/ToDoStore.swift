//
//  ToDoStore.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import Foundation


class ToDoStore: ObservableObject {
    @Published var toDoStore: [ToDo] = []
    
    init() {
        toDoStore = [
            ToDo(work: "운동하기", date: Date()),
            ToDo(work: "줌켜기", date: Date()),
            ToDo(work: "1커밋하기", date: Date()),

        ]
    }
    
    func add(_ toDo: ToDo) {
        toDoStore.append(toDo)
    }
    
    func removeWork(at offsets: IndexSet) {
        toDoStore.remove(atOffsets: offsets)
    }
    
    
    
    
}
