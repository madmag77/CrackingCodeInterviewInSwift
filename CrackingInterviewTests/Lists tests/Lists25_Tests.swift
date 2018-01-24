//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists25_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testSumTwoEqualSimpleNumbers() {
        // Given
        let list1 = ListImpl(with: [3, 2, 1])
        let list2 = ListImpl(with: [4, 3, 2])
        let result = ListImpl(with: [7, 5, 3])

        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)

        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testSumTwoEqualNumbersWithOverrides() {
        // Given
        let list1 = ListImpl(with: [3, 8, 1])
        let list2 = ListImpl(with: [4, 3, 8])
        let result = ListImpl(with: [7, 1, 0, 1])

        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testSumTwoNonEualSimpleNumbers() {
        // Given
        let list1 = ListImpl(with: [3, 0, 1, 0, 9])
        let list2 = ListImpl(with: [4, 3, 2])
        let result = ListImpl(with: [7, 3, 3, 0, 9])

        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testSumWithEmpty() {
        // Given
        let list1 = ListImpl<Int>()
        let list2 = ListImpl(with: [4, 3, 2])
        let result = ListImpl(with: [4, 3, 2])

        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testReverseSumTwoEqualSimpleNumbers() {
        // Given
        let list1 = ListImpl(with: [1, 2, 3])
        let list2 = ListImpl(with: [2, 3, 4])
        let result = ListImpl(with: [3, 5, 7])
        
        // When
        let sumResult = tasks.sumNumbersAsReverseLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testReverseSumTwoEqualNumbersWithOverrides() {
        // Given
        let list1 = ListImpl(with: [1, 8, 3])
        let list2 = ListImpl(with: [8, 3, 4])
        let result = ListImpl(with: [1, 0, 1, 7])
        
        // When
        let sumResult = tasks.sumNumbersAsReverseLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testReverseSumTwoNonEualSimpleNumbers() {
        // Given
        let list1 = ListImpl(with: [9, 0, 1, 0, 3])
        let list2 = ListImpl(with: [2, 3, 4])
        let result = ListImpl(with: [9, 0, 3, 3, 7])
        
        // When
        let sumResult = tasks.sumNumbersAsReverseLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testReverseSumTwoNonEualMultipleOverrideNumbers() {
        // Given
        let list1 = ListImpl(with: [9, 9, 9, 9, 9])
        let list2 = ListImpl(with: [1, 1, 1, 1, 1, 1])
        let result = ListImpl(with: [2, 1, 1, 1, 1, 0])
        
        // When
        let sumResult = tasks.sumNumbersAsReverseLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }
    
    func testReverseSumWithEmpty() {
        // Given
        let list1 = ListImpl<Int>()
        let list2 = ListImpl(with: [4, 3, 2])
        let result = ListImpl(with: [4, 3, 2])
        
        // When
        let sumResult = tasks.sumNumbersAsReverseLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, result)
    }

  }

