//
//  TimeIntervalTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 26/05/23.
//

import XCTest
@testable import ToDo

final class TimeIntervalTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getString_shouldReturnDateString() throws {
        let format = "yyyy/MM/dd"
        
        let inputString = "2023/05/23"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: inputString)
        
        
        let timeInterval = try XCTUnwrap(date?.timeIntervalSince1970)
        let dateString = timeInterval.getString(format: format)
        XCTAssertEqual(dateString, inputString)
    }

}
