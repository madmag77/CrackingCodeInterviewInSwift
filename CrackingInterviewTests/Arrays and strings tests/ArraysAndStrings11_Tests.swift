//
//  ArraysAndStrings11_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings11_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testStringWithoutDuplicates() {
        // Given
        let stringWithoutDuplicates = "qwerty"
        
        // When
        let hasDuplicates = tasks.hasDuplicates(in: stringWithoutDuplicates)
        
        // Then
        XCTAssertFalse(hasDuplicates)
    }
    
    func testStringWithDuplicates() {
        // Given
        let stringWithDuplicates = "qwertyq"
        
        // When
        let hasDuplicates = tasks.hasDuplicates(in: stringWithDuplicates)
        
        // Then
        XCTAssertTrue(hasDuplicates)
    }
    

}
