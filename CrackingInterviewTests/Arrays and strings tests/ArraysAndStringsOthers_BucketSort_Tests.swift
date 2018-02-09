//
//  ArraysAndStringsOthers_BucketSort_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStringsOthers_BucketSort_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testBucketSort() {
        // Given
        let array = [9, 5, 1, 3, 0, 44, 3]
        
        // When
        let sorted = tasks.bucketSort(array, bucketsCount: 5)
        
        // Then
        XCTAssertEqual(sorted, [0, 1, 3, 3, 5, 9, 44])
    }
    
    func testBucketSortEven() {
        // Given
        let array = [9, 5, 1, 0, 44, 3]
        
        // When
        let sorted = tasks.bucketSort(array, bucketsCount: 5)
        
        // Then
        XCTAssertEqual(sorted, [0, 1, 3, 5, 9, 44])
    }
    
    func testBucketSortOneElement() {
        // Given
        let array = [9]
        
        // When
        let sorted = tasks.bucketSort(array, bucketsCount: 5)
        
        // Then
        XCTAssertEqual(sorted, [9])
    }

}
