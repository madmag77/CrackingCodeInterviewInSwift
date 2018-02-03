//
//  Graphs42_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Graphs42_Tests: XCTestCase {
    var tasks: GraphTasks!
    
    override func setUp() {
        super.setUp()
        tasks = GraphTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func _testSmallTree() {
        // Given
        let array = [1, 4, 6, 89]
        
        // When
        let binaryTree = tasks.searchBinaryTreeFrom(array: array)
        
        // Then
        XCTAssertEqual(binaryTree.nodes[0].data, 89)
        XCTAssertEqual(binaryTree.nodes[0].children[0].data, 4)
        XCTAssertEqual(binaryTree.nodes[0].children[0].children[0].data, 1)
        XCTAssertEqual(binaryTree.nodes[0].children[0].children[1].data, 6)
    }
    
    func _testMediumTree() {
        // Given
        let array = [2, 4, 6, 8, 10, 20]
        
        // When
        let binaryTree = tasks.searchBinaryTreeFrom(array: array)
        
        // Then
        XCTAssertEqual(binaryTree.nodes[0].data, 8)
        XCTAssertEqual(binaryTree.nodes[0].children[0].data, 4)
        XCTAssertEqual(binaryTree.nodes[0].children[1].data, 10)
        XCTAssertEqual(binaryTree.nodes[0].children[0].children[0].data, 2)
        XCTAssertEqual(binaryTree.nodes[0].children[0].children[1].data, 6)
        XCTAssertEqual(binaryTree.nodes[0].children[1].children[0].data, 20)
    }
}

