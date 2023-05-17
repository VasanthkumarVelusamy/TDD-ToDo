//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 17/05/23.
//

import XCTest
@testable import ToDo

final class ToDoItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_takesTitle_setsTitle() {
        let item = ToDoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy")
    }
    
    func test_init_takesTitleAndDescription_setsTitleAndDescription() {
        let item = ToDoItem(title: "Dummy", description: "Empty Description")
        XCTAssertEqual(item.description, "Empty Description")
    }
    
    func test_init_setsTimeStamp() throws {
        let dummyTimeStamp: TimeInterval = 12.0
        let item = ToDoItem(title: "Dummy", timeStamp: dummyTimeStamp)
        let timeStamp = try XCTUnwrap(item.timeStamp)
        XCTAssertEqual(timeStamp, dummyTimeStamp, accuracy: 0.000_001)
    }
    
    func test_init_whenGivenLocation_setsLocation() throws {
        let dummyLocationName = "Dummy Location"
        let dummyLocation = Location(title: dummyLocationName)
        let item = ToDoItem(title: "Dummy", location: dummyLocation)
        let location = try XCTUnwrap(item.location)
        XCTAssertEqual(location.title, dummyLocation.title)
    }
    
    func test_init_whenPassedLocation_setsCorrectLocation() throws {
        let inputLocation = Location(title: "Vadasithur")
        let toDoItem = ToDoItem(title: "Dummy ToDo", location: inputLocation)
        XCTAssertEqual(toDoItem.location, inputLocation)
    }
}
