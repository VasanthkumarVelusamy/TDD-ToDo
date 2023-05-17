//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 17/05/23.
//

import XCTest
@testable import ToDo
import CoreLocation

final class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_setsCoordinate() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(title: "Dummy location", coordinate: coordinate)
        let resultCoordinate = try XCTUnwrap(location.coordinate)
        XCTAssertEqual(resultCoordinate.latitude, 1, accuracy: 0.000_001)
        XCTAssertEqual(resultCoordinate.longitude, 2, accuracy: 0.000_001)
    }
    
    func test_init_whenNamePassed_setsName() {
        let name = "Coimbatore"
        let location = Location(title: name)
        XCTAssertEqual(location.title, name)
    }

}
