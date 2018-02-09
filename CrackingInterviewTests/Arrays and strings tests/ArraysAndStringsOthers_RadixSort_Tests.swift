//
//  ArraysAndStringsOthers_RadixSort_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStringsOthers_RadixSort_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testRadixSort() {
        // Given
        let array = [9, 0, 44, 3, 163, 31, 3, 356, 14, 32, 1054]
        
        // When
        let sorted = tasks.radixSort(array)
        
        // Then
        XCTAssertEqual(sorted, [0, 3, 3, 9, 14, 31, 32, 44, 163, 356, 1054])
    }
    
    func testRadixSortEven() {
        // Given
        let array = [9, 5, 1, 0, 44, 3]
        
        // When
        let sorted = tasks.radixSort(array)
        
        // Then
        XCTAssertEqual(sorted, [0, 1, 3, 5, 9, 44])
    }
    
    func testRadixSortOneElement() {
        // Given
        let array = [9]
        
        // When
        let sorted = tasks.radixSort(array)
        
        // Then
        XCTAssertEqual(sorted, [9])
    }

}
