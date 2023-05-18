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
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
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

}
