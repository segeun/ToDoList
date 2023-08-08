//
//  ToDoStore.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import Foundation


class ToDoStore: ObservableObject {
    @Published var toDoStore: [ToDo] = []
    @Published var showAlert = false

    
    init() {
        toDoStore = [
            ToDo(work: "운동하기", date: Date()),
            ToDo(work: "줌켜기", date: Date()),
            ToDo(work: "1커밋하기", date: Date()),

        ]
    }
    
    func add(work: String, date: Date) {
        let newTodo = ToDo(work: work, date: date)
        
        toDoStore.append(newTodo)
//        newWorkText = ""
//        dueDate = Date()
    }
    
    func removeWork(at offsets: IndexSet) {
        toDoStore.remove(atOffsets: offsets)
    }
    
//    func dueDateFormatted(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return formatter.string(from: date)
//    } // 당장은 없어도 됨 toDo에서 이미 계산속성으로 만듦
    

    
    
}
