//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists26_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testTruePalindromOdd() {
        // Given
        let list = ListImpl(with: [1, 2, 1])
        
        // When
        let isPalindrom = tasks.isPalindrom(list)
        
        // Then
        XCTAssertEqual(isPalindrom, true)
    }
    
    func testTruePalindromEven() {
        // Given
        let list = ListImpl(with: [1, 2, 2, 1])
        
        // When
        let isPalindrom = tasks.isPalindrom(list)
        
        // Then
        XCTAssertEqual(isPalindrom, true)
    }
    
    func testTrueOneNodePalindrom() {
        // Given
        let list = ListImpl(with: [1])
        
        // When
        let isPalindrom = tasks.isPalindrom(list)
        
        // Then
        XCTAssertEqual(isPalindrom, true)
    }
    
    func testFalsePalindromEven() {
        // Given
        let list = ListImpl(with: [1, 2, 5, 7])
        
        // When
        let isPalindrom = tasks.isPalindrom(list)
        
        // Then
        XCTAssertEqual(isPalindrom, false)
    }
    
    func testFalsePalindromOdd() {
        // Given
        let list = ListImpl(with: [1, 2, 5, 7, 3])
        
        // When
        let isPalindrom = tasks.isPalindrom(list)
        
        // Then
        XCTAssertEqual(isPalindrom, false)
    }
}

