//
//  ArraysAndStrings14_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings14_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testPolindromString() {
        // Given
        let stringCanBePalindrom = "taaacoactaa"
        
        // When
        let canBePalindrom = tasks.isPalindrom(stringCanBePalindrom)
        
        // Then
        XCTAssertTrue(canBePalindrom)
    }
    
    func testOneSymbolPolindromString() {
        // Given
        let stringCanBePalindrom = "a"
        
        // When
        let canBePalindrom = tasks.isPalindrom(stringCanBePalindrom)
        
        // Then
        XCTAssertTrue(canBePalindrom)
    }
    
    func testNonPolindromString() {
        // Given
        let stringCanBePalindrom = "taaacoelnmactaa"
        
        // When
        let canBePalindrom = tasks.isPalindrom(stringCanBePalindrom)
        
        // Then
        XCTAssertFalse(canBePalindrom)
    }

}
