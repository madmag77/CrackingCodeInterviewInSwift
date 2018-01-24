//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists22_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testSearchElementFromTheEnd() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        let found = tasks.searchNodeFromEnd(in: list, indexFromEnd: 1)
        
        // Then
        XCTAssertEqual(found?.data, 4)
    }
    
    func testSearchLastElementFromTheEnd() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        let found = tasks.searchNodeFromEnd(in: list, indexFromEnd: 0)
        
        // Then
        XCTAssertEqual(found?.data, 5)
    }
    
    func testSearchFirstElementFromTheEnd() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        let found = tasks.searchNodeFromEnd(in: list, indexFromEnd: 4)
        
        // Then
        XCTAssertEqual(found?.data, 1)
    }
    
    func testSearchNonExistentElementFromTheEnd() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        let found = tasks.searchNodeFromEnd(in: list, indexFromEnd: 100)
        
        // Then
        XCTAssertNil(found)
    }
    
    func testSearchElementFromTheEndInEmptyList() {
        // Given
        let list = ListImpl<Int>()
        
        // When
        let found = tasks.searchNodeFromEnd(in: list, indexFromEnd: 0)
        
        // Then
        XCTAssertNil(found)
    }
    
 }

