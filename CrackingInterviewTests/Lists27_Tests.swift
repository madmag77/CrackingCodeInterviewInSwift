//
//  Lists27_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists27_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testNotIntercected() {
        // Given
        let list1 = ListImpl(with: [1, 2, 1])
        let list2 = ListImpl(with: [1, 2, 1])
        
        // When
        let intersection = tasks.firstIntersection(list1, list2)
        
        // Then
        XCTAssertNil(intersection)
    }
    
    func testNotIntercectedEmpty() {
        // Given
        let list1 = ListImpl<Int>()
        let list2 = ListImpl(with: [1, 2, 1])
        
        // When
        let intersection = tasks.firstIntersection(list1, list2)
        
        // Then
        XCTAssertNil(intersection)
    }
    
    func testIntercected() {
        // Given
        let list1 = ListImpl(with: [1, 2, 1])
        let list2 = ListImpl(with: [1, 2, 1])
        let intersectionToCheck = list1.tail
        list2.addNodeAfterTail(intersectionToCheck!)
        
        // When
        let intersection = tasks.firstIntersection(list1, list2)
        
        // Then
        XCTAssert(intersection === intersectionToCheck)
    }
}

