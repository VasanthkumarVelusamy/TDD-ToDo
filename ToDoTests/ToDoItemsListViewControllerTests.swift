//
//  ToDoItemsListViewControllerTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 18/05/23.
//

import XCTest
@testable import ToDo

final class ToDoItemsListViewControllerTests: XCTestCase {

    var sut: ToDoItemsListViewController!
    var toDoItemStoreMock: ToDoItemStoreProtocolMock!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
        toDoItemStoreMock = ToDoItemStoreProtocolMock()
        sut.toDoItemStore = toDoItemStoreMock
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_shouldBeSetUp() {
        XCTAssertNotNil(sut)
    }
    
    func test_souldHaveTableView() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    func test_numberOfRow_whenOneItemIsSent_shouldReturnOne() {
        let toDoItem = ToDoItem(title: "Dummy")
        toDoItemStoreMock.itemPublisher.send([toDoItem])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 1)
    }
    
    func test_numberOfRows_whenTwoItemsAreSent_shouldReturnTwo() {
        let toDoItem1 = ToDoItem(title: "Dummy1")
        let toDoItem2 = ToDoItem(title: "Dummy2")
        
        toDoItemStoreMock.itemPublisher.send([toDoItem1, toDoItem2])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 2)
    }

}
