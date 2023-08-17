//
//  ToDo.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import Foundation

struct ToDo: Identifiable {
    var id: String = UUID().uuidString
    var work: String
    var date: TimeInterval = Date().timeIntervalSince1970
    
    
    var dateString: String {
        
        let dateCreatedAt = Date(timeIntervalSince1970: date)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd EEE h:mm a"
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}


