//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 19/05/23.
//

import Foundation
@testable import ToDo
import Combine

class ToDoItemStoreProtocolMock: ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    var checkLastCallArgument: ToDoItem?
    
    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
}
