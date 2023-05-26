//
//  ToDoItemDetailsViewControllerTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 26/05/23.
//

import XCTest
@testable import ToDo

final class ToDoItemDetailsViewControllerTests: XCTestCase {
    var sut: ToDoItemDetailsViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "ToDoItemDetailsViewController") as! ToDoItemDetailsViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_view_shouldHaveTitleLabel() throws {
        let titleLabel = try XCTUnwrap(sut?.titleLabel)
        XCTAssertTrue(titleLabel.isDescendant(of: sut.view))
    }
    
    func test_view_shouldHaveDateLabel() throws {
        let dateLabel = try XCTUnwrap(sut?.dateLabel)
        XCTAssertTrue(dateLabel.isDescendant(of: sut.view))
    }
    
    func test_view_shouldHaveLocationLabel() throws {
        let locationLabel = try XCTUnwrap(sut?.locationLabel)
        XCTAssertTrue(locationLabel.isDescendant(of: sut.view))
    }
    
    func test_view_shouldHaveDescriptionLabel() throws {
        let descriptionLabel = try XCTUnwrap(sut?.descriptionLabel)
        XCTAssertTrue(descriptionLabel.isDescendant(of: sut.view))
    }
    
    func test_view_shouldHaveMapView() throws {
        let mapView = try XCTUnwrap(sut?.mapView)
        XCTAssertTrue(mapView.isDescendant(of: sut.view))
    }
    
    func test_view_shouldHaveDoneButton() throws {
        let doneButton = try XCTUnwrap(sut?.doneButton)
        XCTAssertTrue(doneButton.isDescendant(of: sut.view))
    }
    
}
