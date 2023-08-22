//
//  TodoDetailView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/21.
//

import SwiftUI

struct TodoDetailView: View {
    
    var todo: ToDo
    
    @StateObject var reply = ReplyStore()
    
    @State private var replyText: String = ""
    
    var trimReplyText: String {
        replyText.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TodoCellView(todo: todo)
                
                List(reply.replyStore) { replies in
                    VStack(alignment: .leading) {
                        Text(replies.userName)
                        Text(replies.dateString)
                            .font(.caption)
                        VStack {
                            Text(replies.text)
                        }
                    }
                }
                .listStyle(.plain)
                
                HStack {
                    TextField("댓글 달기", text: $replyText)
                    
                    Button {
                        let replies = Reply(text: trimReplyText)
                        reply.addReply(replies)
                        replyText = ""
                    } label: {
                        Image(systemName: "location.fill")
                            .font(.title)
                    }
                    .disabled(trimReplyText.isEmpty)
                }
                .padding()
                
            }
        }
        .navigationTitle("To Do")
        .onAppear {
            reply.todoId = todo.id
            reply.fetchReplies()
        }
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
