//
//  ArraysAndStrings12_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings12_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testRearrangedStrings() {
        // Given
        let string1 = "abc"
        let string2 = "cab"
        
        // When
        let isRearrangement = tasks.isRearrangement(string1: string1,
                                                    string2: string2)
        
        // Then
        XCTAssertTrue(isRearrangement)
    }
    
    func testNotRearrangedStrings() {
        // Given
        let string1 = "abc"
        let string2 = "cbb"
        
        // When
        let isRearrangement = tasks.isRearrangement(string1: string1,
                                                    string2: string2)
        
        // Then
        XCTAssertFalse(isRearrangement)
    }
    
}
