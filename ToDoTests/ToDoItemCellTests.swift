//
//  ToDoItemCellTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 20/05/23.
//

import XCTest
@testable import ToDo

final class ToDoItemCellTests: XCTestCase {
    
    var sut: ToDoItemCell!

    override func setUpWithError() throws {
        sut = ToDoItemCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_shouldHaveTitleLabel() {
        let titleLabel = sut.titleLabel
        XCTAssertTrue(titleLabel.isDescendant(of: sut.contentView), "title label is not subview of the cell")
    }
    
    func test_shouldHaveDateLabel() {
        let dateLabel = sut.dateLabel
        XCTAssertTrue(dateLabel.isDescendant(of: sut.contentView), "dateLabel is not subview of the cell")
    }
    
    func test_shouldShowLocationLabel() {
        let locationLabel = sut.locationLabel
        XCTAssertTrue(locationLabel.isDescendant(of: sut.contentView))
    }
}
