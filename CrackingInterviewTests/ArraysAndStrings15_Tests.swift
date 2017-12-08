//
//  ArraysAndStrings15_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings15_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testDistanceOneReplace() {
        // Given
        let string1 = "abc"
        let string2 = "abd"
        
        // When
        let isOneDistance = tasks.isOneDistance(from: string1,
                                                to: string2)
        
        // Then
        XCTAssertTrue(isOneDistance)
    }
    
    func testDistanceOneDelete() {
        // Given
        let string1 = "abc"
        let string2 = "ab"
        
        // When
        let isOneDistance = tasks.isOneDistance(from: string1,
                                                to: string2)
        
        // Then
        XCTAssertTrue(isOneDistance)
    }
    
    func testDistanceOneAdd() {
        // Given
        let string1 = "abc"
        let string2 = "abcd"
        
        // When
        let isOneDistance = tasks.isOneDistance(from: string1,
                                                to: string2)
        
        // Then
        XCTAssertTrue(isOneDistance)
    }
    
    func testDistanceMoreThenOne() {
        // Given
        let string1 = "abc"
        let string2 = "abcdq"
        
        // When
        let isOneDistance = tasks.isOneDistance(from: string1,
                                                to: string2)
        
        // Then
        XCTAssertFalse(isOneDistance)
    }
    
    func testDistanceLessThenOne() {
        // Given
        let string1 = "abc"
        let string2 = "abc"
        
        // When
        let isOneDistance = tasks.isOneDistance(from: string1,
                                                to: string2)
        
        // Then
        XCTAssertFalse(isOneDistance)
    }
    
}
