//
//  ToDoStore.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import Foundation
import Firebase
import FirebaseFirestore


class ToDoStore: ObservableObject {
    @Published var todoArray: [ToDo] = []
    @Published var showAlert = false

    let databaseRef = Database.database().reference().child("TodoList")
    
//    init() {
//        toDoStore = [
//            ToDo(work: "운동하기", date: Date()),
//            ToDo(work: "줌켜기", date: Date()),
//            ToDo(work: "1커밋하기", date: Date()),
//
//        ]
//    }
    func fetchData() {
        
        
        
        todoArray = []
        
        
        // databaseRef.getDocuments 고려
        Firestore.firestore().collection("TodoList").getDocuments { (snapshot, error) in
            if let snapshot {
                
                var tempTodoStore: [ToDo] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String: Any] = document.data()
                    let work: String = docData["work"] as? String ?? "(no work)"
                    let date: Double = docData["date"] as? Double ?? 0
                    
                    let todo: ToDo = ToDo(id: id, work: work, date: date)
                    
                    tempTodoStore.append(todo)
                }
                
                self.todoArray = tempTodoStore
                self.sortTodoArray()
            }
        }
    }
    
    
    
    func add(work: String) {
        let newTodo = ToDo(work: work)
        
        Firestore.firestore().collection("TodoList")
            .document(newTodo.id) // 기존에 해당 id의 문서가 있으면 업데이트, 없으면 신규로 추가함
            .setData(["work": newTodo.work,
                      "date": newTodo.date
                     ])
        
        
        todoArray.append(newTodo)
        sortTodoArray()
//        newWorkText = ""
//        dueDate = Date()
    }
    
    func removeWork(at offsets: IndexSet) {
        
        for offset in offsets {
            let todo = todoArray[offset]
            
            Firestore.firestore().collection("TodoList")
                .document(todo.id)
                .delete()
        }

        todoArray.remove(atOffsets: offsets)
        sortTodoArray()
    }
    
    
    func sortTodoArray() {
        todoArray = todoArray.sorted {
            $0.date > $1.date
        }
    }
}
