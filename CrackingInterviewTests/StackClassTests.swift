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
        let val = 1
        
        // When
        stack.push(val)
        let valPeek = stack.peek()

        // Then
        XCTAssertFalse(stack.isEmpty())
        XCTAssertEqual(val, valPeek)

        // When
        let valPop = stack.pop()

        // Then
        XCTAssertTrue(stack.isEmpty())
        XCTAssertEqual(val, valPop)
    }
    
}
