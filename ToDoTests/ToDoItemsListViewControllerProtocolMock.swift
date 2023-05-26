//
//  ToDoItemsListViewControllerProtocolMock.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 25/05/23.
//

import XCTest
@testable import ToDo

class ToDoItemsListViewControllerProtocolMock: ToDoItemsListViewControllerProtocol {
    
    var selectToDoItemsReceivedArguments: (viewController: UIViewController, item: ToDoItem)?
    
    func selectToDoItem(_ viewController: UIViewController, item: ToDo.ToDoItem) {
        selectToDoItemsReceivedArguments = (viewController, item)
    }
    
}
