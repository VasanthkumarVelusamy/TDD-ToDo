//
//  ToDoItemStoreProtocol.swift
//  ToDo
//
//  Created by Vasanth Kumar on 19/05/23.
//

import Foundation
import Combine

protocol ToDoItemStoreProtocol {
    var itemPublisher: CurrentValueSubject<[ToDoItem], Never> { get set }
    func check(_: ToDoItem)
}
