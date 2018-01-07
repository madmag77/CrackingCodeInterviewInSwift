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
        let list = OneLinkListNode<Int>(0)
        OneLinkList.addNode(OneLinkListNode<Int>(1), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(2), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(3), to: list)
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(OneLinkList.nodeCount(of: list), OneLinkList.nodeCount(of: listWithoutDuplicates))
    }
    
    func testListWithDuplicates() {
        // Given
        let list = OneLinkListNode<Int>(0)
        OneLinkList.addNode(OneLinkListNode<Int>(1), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(0), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(3), to: list)
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(OneLinkList.nodeCount(of: listWithoutDuplicates), 3)
        XCTAssertEqual(OneLinkList.getNode(index: 1, in: listWithoutDuplicates)?.data, 1)
        XCTAssertEqual(OneLinkList.getNode(index: 2, in: listWithoutDuplicates)?.data, 3)
    }
    
    func testListWithDuplicatesNonRoot() {
        // Given
        let list = OneLinkListNode<Int>(0)
        OneLinkList.addNode(OneLinkListNode<Int>(1), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(1), to: list)
        OneLinkList.addNode(OneLinkListNode<Int>(3), to: list)
        
        // When
        let listWithoutDuplicates = tasks.removeDuplicates(in: list)
        
        // Then
        XCTAssertEqual(OneLinkList.nodeCount(of: listWithoutDuplicates), 3)
        XCTAssertEqual(OneLinkList.getNode(index: 1, in: listWithoutDuplicates)?.data, 1)
        XCTAssertEqual(OneLinkList.getNode(index: 2, in: listWithoutDuplicates)?.data, 3)
    }
    
 }

