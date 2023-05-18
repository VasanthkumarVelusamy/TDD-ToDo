//
//  ToDoItem.swift
//  ToDo
//
//  Created by Vasanth Kumar on 17/05/23.
//

import Foundation

struct ToDoItem: Equatable {
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID
    let title: String
    let description: String?
    let timeStamp: TimeInterval?
    let location: Location?
    var done = false
    
    init(title: String, description: String? = nil, timeStamp: TimeInterval? = nil, location: Location? = nil) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.timeStamp = timeStamp
        self.location = location
    }
}
