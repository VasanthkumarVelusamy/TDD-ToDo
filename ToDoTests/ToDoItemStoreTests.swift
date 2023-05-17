//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Vasanth Kumar on 17/05/23.
//

import XCTest
@testable import ToDo
import Combine

final class ToDoItemStoreTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_add_shouldPublishChange() throws {
        let sut = ToDoItemStore()
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems: [ToDoItem] = try wait(for: sut.itemPublisher) {
            sut.add(toDoItem)
        }
        XCTAssertEqual(receivedItems, [toDoItem])
    }
}

extension XCTestCase {
    
    func wait<T: Publisher>(
        
        for publisher: T,
        
        afterChange change: () -> Void) throws
    
    -> T.Output where T.Failure == Never {
        
        let publisherExpectation = expectation(
            
            description: "Wait for publisher in \(#file)"
            
        )
        
        var result: T.Output?
        
        let token = publisher
        
            .dropFirst()
        
            .sink { value in
                
                result = value
                
                publisherExpectation.fulfill()
                
            }
        
        change()
        
        wait(for: [publisherExpectation], timeout: 1)
        
        token.cancel()
        
        let unwrappedResult = try XCTUnwrap(
            
            result,
            
            "Publisher did not publish any value"
            
        )
        
        return unwrappedResult
    }
    
}
