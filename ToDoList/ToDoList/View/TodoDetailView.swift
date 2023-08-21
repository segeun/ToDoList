//
//  TodoDetailView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/21.
//

import SwiftUI

struct TodoDetailView: View {
    
    var todo: ToDo
    
    var body: some View {
        VStack {
            TodoCellView(todo: todo)
        }
        .navigationTitle("Todo Detail")
        .navigationBarTitleDisplayMode(.inline)
//        .onAppear {
//            ToDoStore.fetchData()
//        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    
    @State static var todo = ToDoStore().sampleTodo
    
    static var previews: some View {
        NavigationStack {
            TodoDetailView(todo: todo)
        }
    }
}
