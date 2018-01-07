//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists21_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testListWithoutDuplicates() {
        // Given
        let list = ListImpl(with: [1, 2, 3])
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(list, listWithoutDuplicates)
    }
    
    func testListWithDuplicates() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 2])
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(listWithoutDuplicates, ListImpl(with: [1, 2, 3]))
    }
    
    func testListWithAllDuplicates() {
        // Given
        let list = ListImpl(with: [1, 1, 1, 1])
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(listWithoutDuplicates, ListImpl(with: [1]))
    }
 }

