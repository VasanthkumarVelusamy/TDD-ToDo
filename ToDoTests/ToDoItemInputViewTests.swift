//
//  ToDoItemInputViewTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 31/05/23.
//

import XCTest
@testable import ToDo
import ViewInspector

//extension ToDoItemInputView: Inspectable { }

final class ToDoItemInputViewTests: XCTestCase {

    var sut: ToDoItemInputView!
    var toDoItemData: ToDoItemData!
    
    override func setUpWithError() throws {
        toDoItemData = ToDoItemData()
        sut = ToDoItemInputView(data: toDoItemData)
    }

    override func tearDownWithError() throws {
        sut = nil
        toDoItemData = nil
    }
    
    func test_titleInput_shouldSetValueInData() throws {
        let expected = "dummy title"
        try sut
            .inspect()
            .find(ViewType.TextField.self)
            .setInput(expected)
        let result = toDoItemData.title
        XCTAssertEqual(result, expected)
    }

}
