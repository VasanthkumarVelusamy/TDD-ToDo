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
    
    func test_settingToDoItem_shouldUpdateTitleLabel() throws {
        let title = "dummy title"
        let toDoItem = ToDoItem(title: title)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.titleLabel.text, title)
    }
    
    func test_settingToDoItem_shouldUpdateDateLabel() throws {
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy/MM/dd"
        let expectedDateString = dateFormater.string(from: date)
        let timeStamp = date.timeIntervalSince1970
        let toDoItem = ToDoItem(title: "Dummy", timeStamp: timeStamp)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.dateLabel.text, expectedDateString)
    }
    
    func test_settingToDoItem_shouldUpdateMap() {
        let latitude: Double = 10
        let longitude: Double = 20
        let toDoItem = ToDoItem(title: "Dummy",
                                location: Location(title: "Some Location",
                                                   coordinate: Coordinate(longitude: longitude,
                                                                          latitude: latitude)))
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, latitude, accuracy: 0.000_01)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, longitude, accuracy: 0.000_01)
    }
    
    func test_settingDoneToDoItem_shouldDisableDoneButton() {
        var toDoItem = ToDoItem(title: "Dummy item")
        toDoItem.done = true
        sut.toDoItem = toDoItem
        XCTAssertFalse(sut.doneButton.isEnabled)
    }
    
    func test_settingUnDoneToDoItem_shouldEnableDoneButton() {
        let toDoItem = ToDoItem(title: "Dummy item")
        sut.toDoItem = toDoItem
        XCTAssertTrue(sut.doneButton.isEnabled)
    }
    
}
