//
//  ReplyStore.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/22.
//

import Foundation
import FirebaseFirestore

class ReplyStore: ObservableObject {
    @Published var replyStore: [Reply] = []
    
    var todoId: String = ""
    
    let dbRef = Firestore.firestore().collection("TodoList")
    
    var sampleReply: Reply {
        Reply(text: "Good")
    }
    
    func fetchReplies() {
        
        dbRef.document(todoId).collection("TodoList").getDocuments { (snapshot, error) in
            self.replyStore.removeAll()
            
            if let snapshot {
                var tempReplies: [Reply] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String : Any] = document.data()
                    let username: String = docData["username"] as? String ?? ""
                    let text: String = docData["text"] as? String ?? ""
                    let date: Double = docData["date"] as? Double ?? 0
                    
                    let reply = Reply(id: id, userName: username, text: text, date: date)
                    
                    tempReplies.append(reply)
                }
                
                self.replyStore = tempReplies
            }
        }
    }
    
    func addReply(_ reply: Reply) {
        
        dbRef.document(todoId).collection("TodoList")
            .document(reply.id)
            .setData(["userName": reply.userName,
                      "text": reply.text,
                      "date": reply.date])
        
        
        fetchReplies()
    }
    
}
