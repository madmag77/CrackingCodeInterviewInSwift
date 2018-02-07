//
//  ArraysAndStringsOthers_MaxSum_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStringsOthers_MaxSum_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testMaxSum() {
        // Given
        let s1 = [1, -2, 2, 5, 0, -6, 4, -2, 6, 0]
        
        // When
        let result = tasks.sequenceWithMaximumSum(in: s1)
        print("sum: \(result.0), start: \(result.1), end: \(result.2)")
        
        // Then
        XCTAssertEqual(result.0, 9)
    }
    
    func testMaxSumOneElement() {
        // Given
        let s1 = [1, -1, 0, 1, 0, -1, 1, -1, 2, -1]
        
        // When
        let result = tasks.sequenceWithMaximumSum(in: s1)
        print("sum: \(result.0), start: \(result.1), end: \(result.2)")

        // Then
        XCTAssertEqual(result.0, 2)
    }
    
    func testMaxSumMinusElements() {
        // Given
        let s1 = [-4, -1, -8, -1, -7, -1, -1, -1, -2, -1]
        
        // When
        let result = tasks.sequenceWithMaximumSum(in: s1)
        print("sum: \(result.0), start: \(result.1), end: \(result.2)")

        // Then
        XCTAssertEqual(result.0, 0)
    }
}
