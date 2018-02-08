//
//  ArraysAndStringsOthers_QuickSort_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStringsOthers_QuickSort_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testQuickSort() {
        // Given
        let array = [9, 5, 1, 3, 0, 44, 3]
        
        // When
        let sorted = tasks.quickSort(array)
        
        // Then
        XCTAssertEqual(sorted, [0, 1, 3, 3, 5, 9, 44])
    }
    
    func testQuickSortEven() {
        // Given
        let array = [9, 5, 1, 0, 44, 3]
        
        // When
        let sorted = tasks.quickSort(array)
        
        // Then
        XCTAssertEqual(sorted, [0, 1, 3, 5, 9, 44])
    }
    
    func testQuickSortOneElement() {
        // Given
        let array = [9]
        
        // When
        let sorted = tasks.quickSort(array)
        
        // Then
        XCTAssertEqual(sorted, [9])
    }

}
