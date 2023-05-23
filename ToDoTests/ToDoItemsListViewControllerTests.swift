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
    
    func test_cellForRow_whenPassedToDoItem_setsCorrectTitle() throws {
        let titleUnderTest = "Dummy"
        toDoItemStoreMock.itemPublisher.send([ToDoItem(title: titleUnderTest)])
        let tableView = try XCTUnwrap(sut.tableView)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell
        XCTAssertEqual(cell?.titleLabel.text, titleUnderTest)
    }
    
    func test_cellForRow_shouldReturnTitle2() throws {
        let toDoItem1 = ToDoItem(title: "Dummy1")
        let toDoItem2 = ToDoItem(title: "Dummy2")
        toDoItemStoreMock.itemPublisher.send([toDoItem1, toDoItem2])
        let tableView = try XCTUnwrap(sut.tableView)
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell
        XCTAssertEqual(cell?.titleLabel.text, "Dummy2")
    }
    
    func test_cellForRowAt_shouldReturnCellWithDate() throws {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let expectedString = dateFormatter.string(from: date)
        let toDoItem = ToDoItem(title: "Dummy", timeStamp: date.timeIntervalSince1970)
        toDoItemStoreMock.itemPublisher.send([toDoItem])
        let tableView = try XCTUnwrap(sut.tableView)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell

        XCTAssertEqual(cell?.dateLabel.text, expectedString)
    }
    
    // ToDoItemsListViewControllerTests.swift

    func test_numberOfSections_shouldReturnTwo() {
      var doneItem = ToDoItem(title: "dummy 2")
      doneItem.done = true
      toDoItemStoreMock.itemPublisher
        .send([ToDoItem(title: "dummy 1"),
               doneItem])
      let result = sut.tableView.numberOfSections
      XCTAssertEqual(result, 2)
    }

}
