//
//  QueueClassTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class QueueClassTests: XCTestCase {
    
    func testEmptyQueue() {
        // Given
        let queue = QueueImpl<Int>()
        
        // When
        
        // Then
        XCTAssertTrue(queue.isEmpty())
    }
    
    func testAddAndGetFromQueue() {
        // Given
        let queue = QueueImpl<Int>()
        let val1 = 1
        let val2 = 1

        // When
        queue.push(val1)
        queue.push(val2)
        let valPeek = queue.peek()

        // Then
        XCTAssertFalse(queue.isEmpty())
        XCTAssertEqual(val1, valPeek)

        // When
        let _ = queue.pop()
        let valPop = queue.pop()

        // Then
        XCTAssertTrue(queue.isEmpty())
        XCTAssertEqual(val2, valPop)
    }
    
}
