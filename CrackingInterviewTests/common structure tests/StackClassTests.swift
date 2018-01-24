//
//  StackClassTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class StackClassTests: XCTestCase {
    
    func testEmptyStack() {
        // Given
        let stack = StackImpl<Int>()
        
        // When
        
        // Then
        XCTAssertTrue(stack.isEmpty())
    }
    
    func testAddAndGetFromStack() {
        // Given
        let stack = StackImpl<Int>()
        let val1 = 1
        let val2 = 1

        // When
        stack.push(val1)
        stack.push(val2)
        let valPeek = stack.peek()

        // Then
        XCTAssertFalse(stack.isEmpty())
        XCTAssertEqual(val2, valPeek)

        // When
        let _ = stack.pop()
        let valPop = stack.pop()

        // Then
        XCTAssertTrue(stack.isEmpty())
        XCTAssertEqual(val1, valPop)
    }
    
}
