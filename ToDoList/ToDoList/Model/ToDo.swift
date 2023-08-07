//
//  ToDo.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import Foundation

struct ToDo: Identifiable {
    var id: UUID = UUID()
    var work: String
    var date: Date
    
    
    var dateString: String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd EEEE HH:mm"
        
        return dateFormatter.string(from: date)
    }
}


