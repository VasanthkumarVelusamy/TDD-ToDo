//
//  ToDoItem.swift
//  ToDo
//
//  Created by Vasanth Kumar on 17/05/23.
//

import Foundation

struct ToDoItem: Equatable {
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        lhs.title == rhs.title
    }
    
    let title: String
    let description: String?
    let timeStamp: TimeInterval?
    let location: Location?
    
    init(title: String, description: String? = nil, timeStamp: TimeInterval? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.timeStamp = timeStamp
        self.location = location
    }
}
