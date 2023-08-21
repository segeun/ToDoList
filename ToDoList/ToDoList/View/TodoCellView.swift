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
            Text(todo.dateString)
        }
        .font(.title2)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 150))
        .background(Color.green)
        .shadow(radius: 8)
    }
}

struct TodoCellView_Previews: PreviewProvider {
    @State static var todo = ToDoStore().sampleTodo
    
    
    static var previews: some View {
        Group {
            TodoCellView(todo: todo)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
            
            TodoCellView(todo: todo)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            
        }
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
