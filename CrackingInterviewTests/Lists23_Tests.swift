//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists23_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testRemoveElement() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        tasks.removeNodeFromList(in: list, nodeToRemove: list.getNode(at: 2)!)
        
        // Then
        XCTAssertEqual(list, ListImpl(with: [1, 2, 4, 5]))
    }
    
    func testRemoveNotExistedElement() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5])
        
        // When
        tasks.removeNodeFromList(in: list, nodeToRemove: OneLinkListNode(4))

        // Then
        XCTAssertEqual(list, ListImpl(with: [1, 2, 3, 4, 5]))
    }

  }

