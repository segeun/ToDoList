//
//  TodoCellView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/21.
//

import SwiftUI

struct TodoCellView: View {
    
    var todo: ToDo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.work)
                .font(.system(size: 30).bold())
            HStack {
                Text(todo.dateString)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct TodoCellView_Previews: PreviewProvider {
    @State static var todo = ToDoStore().sampleTodo
    
    
    static var previews: some View {
        Group {
            TodoCellView(todo: todo)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            
            TodoCellView(todo: todo)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
            
        }
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
