//
//  ArraysAndStrings17_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings17_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testNormal3MatrixRotation() {
        // Given
        let arrayToBeRotated: [[Int]] = [[1, 2, 3],
                                         [4, 5, 6],
                                         [7, 8, 9]]
        
        // When
        let rotatedArray: [[Int]] = tasks.rotateMatrix90Clockwise(arrayToBeRotated)
        
        // Then
        XCTAssertEqual(rotatedArray[0], [7, 4, 1])
        XCTAssertEqual(rotatedArray[1], [8, 5, 2])
        XCTAssertEqual(rotatedArray[2], [9, 6, 3])
    }
    
    func testNormal4MatrixRotation() {
        // Given
        let arrayToBeRotated: [[Int]] = [[1, 2, 3, 4],
                                         [5, 6, 7, 8],
                                         [9, 10, 11, 12],
                                         [13, 14, 15, 16]]
        
        // When
        let rotatedArray: [[Int]] = tasks.rotateMatrix90Clockwise(arrayToBeRotated)
        
        // Then
        XCTAssertEqual(rotatedArray[0], [13, 9, 5, 1])
        XCTAssertEqual(rotatedArray[1], [14, 10, 6, 2])
        XCTAssertEqual(rotatedArray[2], [15, 11, 7, 3])
        XCTAssertEqual(rotatedArray[3], [16, 12, 8, 4])
    }
    
    func testNonSquareMatrixRotation() {
        // Given
        let arrayToBeRotated: [[Int]] = [[1, 2, 3, 4],
                                         [5, 6, 7, 8],
                                         [9, 10, 11, 12]]
        
        // When
        let rotatedArray: [[Int]] = tasks.rotateMatrix90Clockwise(arrayToBeRotated)
        
        // Then
        XCTAssertEqual(rotatedArray[0], [9, 5, 1])
        XCTAssertEqual(rotatedArray[1], [10, 6, 2])
        XCTAssertEqual(rotatedArray[2], [11, 7, 3])
        XCTAssertEqual(rotatedArray[3], [12, 8, 4])
    }
    
    func testEmptyMatrixRotation() {
        // Given
        let arrayToBeRotated: [[Int]] = [[]]
        
        // When
        let rotatedArray: [[Int]] = tasks.rotateMatrix90Clockwise(arrayToBeRotated)
        
        // Then
        XCTAssertTrue(rotatedArray.isEmpty)
    }
}
