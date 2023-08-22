//
//  Reply.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/22.
//

import Foundation


struct Reply: Identifiable {
    var id: String = UUID().uuidString
    var userName: String = "Chris"
    var text: String
    var date: Double = Date().timeIntervalSince1970
    
    var dateString: String {
        let dateCreatedAt: Date = Date(timeIntervalSince1970: date)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM/dd a hh:mm"
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
