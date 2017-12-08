//
//  ArraysAndStrings13_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings13_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testStringWithSpaces() {
        // Given
        let string = "a  sss ss  w   "
        
        // When
        let stringWithReplacedSpaces = tasks.stringWithReplacedSpaces(from: string)
        
        // Then
        XCTAssertEqual(stringWithReplacedSpaces, "a%20%20sss%20ss%20%20w%20%20%20")
    }

    func testStringWithoutSpaces() {
        // Given
        let string = "aaaaauuuruuQQQQFFFFFF"
        
        // When
        let stringWithReplacedSpaces = tasks.stringWithReplacedSpaces(from: string)
        
        // Then
        XCTAssertEqual(stringWithReplacedSpaces, string)
    }
    
}
