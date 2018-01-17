//
//  Lists21_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists24_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testReoderList() {
        // Given
        let list = ListImpl(with: [10, 2, 5, 3, 1, 5])
        
        // When
        tasks.reoderList(list, relativeTo: list.getNode(at: 5)!)
        
        // Then
        let sumLeft = list.getNode(at: 0)!.data + list.getNode(at: 1)!.data + list.getNode(at: 2)!.data
        let sumRight = list.getNode(at: 3)!.data + list.getNode(at: 4)!.data + list.getNode(at: 5)!.data
        
        XCTAssertEqual(sumLeft, 6)
        XCTAssertEqual(sumRight, 20)
    }
    
    func testReoderOrderedList() {
        // Given
        let list = ListImpl(with: [1, 2, 3, 4, 5, 50])
        
        // When
        tasks.reoderList(list, relativeTo: list.getNode(at: 3)!)
        
        // Then
        let sumLeft = list.getNode(at: 0)!.data + list.getNode(at: 1)!.data + list.getNode(at: 2)!.data
        let sumRight = list.getNode(at: 3)!.data + list.getNode(at: 4)!.data + list.getNode(at: 5)!.data
        
        XCTAssertEqual(sumLeft, 6)
        XCTAssertEqual(sumRight, 59)
    }
    
    func testReoderSmallList() {
        // Given
        let list = ListImpl(with: [10, 1])
        
        // When
        tasks.reoderList(list, relativeTo: list.getNode(at: 0)!)
        
        // Then
        let sumLeft = list.getNode(at: 0)!.data
        let sumRight = list.getNode(at: 1)!.data
        
        XCTAssertEqual(sumLeft, 1)
        XCTAssertEqual(sumRight, 10)
    }

  }

