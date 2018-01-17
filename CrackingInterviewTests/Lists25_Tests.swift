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
        
        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, ListImpl(with: [7, 5, 3]))
    }
    
    func testSumTwoEqualNumbersWithOverrides() {
        // Given
        let list1 = ListImpl(with: [3, 8, 1])
        let list2 = ListImpl(with: [4, 3, 8])
        
        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, ListImpl(with: [7, 1, 0, 1]))
    }
    
    func testSumTwoNonEualSimpleNumbers() {
        // Given
        let list1 = ListImpl(with: [3, 0, 1, 0, 9])
        let list2 = ListImpl(with: [4, 3, 2])
        
        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, ListImpl(with: [7, 3, 3, 0, 9]))
    }
    
    func testSumWithEmpty() {
        // Given
        let list1 = ListImpl<Int>()
        let list2 = ListImpl(with: [4, 3, 2])
        
        // When
        let sumResult = tasks.sumNumbersAsLists(list1, list2)
        
        // Then
        XCTAssertEqual(sumResult, ListImpl(with: [4, 3, 2]))
    }
  }

