//
//  Lists28_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Lists28_Tests: XCTestCase {
    var tasks: ListsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ListsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testNoCycles() {
        // Given
        let list = ListImpl(with: [1, 2, 1])
        
        // When
        let firstCycleNode = tasks.firstNodeOfCycle(list)
        
        // Then
        XCTAssertNil(firstCycleNode)
    }
    
    func testCycle() {
        // Given
        let list = ListImpl(with: [9, 3, 5, 1, 6, 8])
        let cycleNode = list.getNode(at: 2)
        list.addNodeAfterTail(cycleNode!)
        
        // When
        let firstCycleNode = tasks.firstNodeOfCycle(list)
        
        // Then
        XCTAssert(firstCycleNode === cycleNode)
    }
    
    func testCycleFromRoot() {
        // Given
        let list = ListImpl(with: [9, 3, 5, 1, 6, 8])
        let cycleNode = list.root
        list.addNodeAfterTail(cycleNode!)
        
        // When
        let firstCycleNode = tasks.firstNodeOfCycle(list)
        
        // Then
        XCTAssert(firstCycleNode === cycleNode)
    }
    
    func testOneNodeCycle() {
        // Given
        let list = ListImpl(with: [9, 3, 5, 1, 6, 8])
        let cycleNode = list.getNode(at: 5)
        list.addNodeAfterTail(cycleNode!)
        
        // When
        let firstCycleNode = tasks.firstNodeOfCycle(list)
        
        // Then
        XCTAssert(firstCycleNode === cycleNode)
    }
}

