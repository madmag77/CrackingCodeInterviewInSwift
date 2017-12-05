//
//  ArraysAndStrings19_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 04/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings19_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testIsStringShifted() {
        // Given
        let s1: String = "waterbottle"
        let s2: String = "erbottlewat"
        
        // When
        let shifted = tasks.isStringShifted(s2, shiftedFrom: s1)
        
        // Then
        XCTAssertTrue(shifted)
    }
    
    func testIsStringNotShifted() {
        // Given
        let s1: String = "waterbottle"
        let s2: String = "waterbottel"
        
        // When
        let shifted = tasks.isStringShifted(s2, shiftedFrom: s1)
        
        // Then
        XCTAssertFalse(shifted)
    }
}
