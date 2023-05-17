//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Vasanth Kumar on 17/05/23.
//

import Foundation
import Combine

class ToDoItemStore {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
    }
    
}
