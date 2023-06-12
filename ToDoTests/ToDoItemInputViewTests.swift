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
    
    func test_whenNoDate_shouldNotShowDateInput() {
        XCTAssertThrowsError(try sut.inspect().find(ViewType.DatePicker.self))
    }
    
    func test_whenWithDate_shouldAllowDateInput() throws {
        let exp = sut.on(\.didAppear) { view in
            try view.find(ViewType.Toggle.self).tap()
            let expected = Date(timeIntervalSince1970: 1_000_000)
            try view.find(ViewType.DatePicker.self).select(date: expected)
            let input = self.toDoItemData.date
            XCTAssertEqual(input, expected)
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }

}
