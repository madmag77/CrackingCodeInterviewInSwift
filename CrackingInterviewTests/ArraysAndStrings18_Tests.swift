//
//  ArraysAndStrings17_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

import XCTest
@testable import CrackingInterview

class ArraysAndStrings18_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testMatrixNullation() {
        // Given
        let arrayToBeNulled: [[Int]] = [[1, 0, 3],
                                        [4, 5, 6],
                                        [7, 0, 9]]
        
        // When
        let nulledArray: [[Int]] = tasks.fillWithNulls(arrayToBeNulled)
        
        // Then
        XCTAssertEqual(nulledArray[0], [0, 0, 0])
        XCTAssertEqual(nulledArray[1], [4, 0, 6])
        XCTAssertEqual(nulledArray[2], [0, 0, 0])
    }
    
    func testNoNullsMatrixNullation() {
        // Given
        let arrayToBeNulled: [[Int]] = [[1, 2, 3],
                                        [4, 5, 6],
                                        [7, 8, 9]]
        
        // When
        let nulledArray: [[Int]] = tasks.fillWithNulls(arrayToBeNulled)
        
        // Then
        XCTAssertEqual(nulledArray[0], [1, 2, 3])
        XCTAssertEqual(nulledArray[1], [4, 5, 6])
        XCTAssertEqual(nulledArray[2], [7, 8, 9])
    }
    
}
