//
//  SearchBinaryTreeTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class SearchBinaryTreeTests: XCTestCase {
    lazy var testTree: SearchBinaryTreeImpl<Int> = {
        let tree = SearchBinaryTreeImpl<Int>()
        
        tree.root = BinaryNode(15)
        tree.root?.setLeft(6)
        tree.root?.setRight(18)
        tree.root?.left?.setLeft(3)
        tree.root?.left?.setRight(7)
        tree.root?.left?.left?.setLeft(2)
        tree.root?.left?.left?.setRight(4)
        tree.root?.left?.right?.setRight(13)
        tree.root?.left?.right?.right?.setLeft(9)
        tree.root?.right?.setLeft(17)
        tree.root?.right?.setRight(20)
        
        return tree
    }()
    
    lazy var testTreeWithEqualNodes: SearchBinaryTreeImpl<Int> = {
        let tree = SearchBinaryTreeImpl<Int>()
        
        tree.root = BinaryNode(15)
        tree.root?.setLeft(6)
        tree.root?.setRight(15)
        tree.root?.left?.setLeft(2)
        tree.root?.left?.setRight(7)
        tree.root?.left?.left?.setLeft(2)
        tree.root?.left?.left?.setRight(4)
        tree.root?.left?.right?.setRight(13)
        tree.root?.left?.right?.right?.setLeft(9)
        tree.root?.right?.setLeft(14)
        tree.root?.right?.setRight(20)
        
        return tree
    }()

    func testEmptyBinaryTree() {
        // Given
        let tree = SearchBinaryTreeImpl<Int>()
        
        // When
        
        // Then
        XCTAssertNil(tree.root)
    }
    
    func testConstructionBinaryTree() {
        // Given
        
        // When
        let tree = testTree
        
        // Then
        XCTAssertEqual(tree.root?.left?.left?.left?.data, 2)
        XCTAssertEqual(tree.root?.right?.right?.data, 20)
    }
    
    func testSearhingForMaxValueBinaryTree() {
        // Given
        let tree = testTree

        // When
        let max = tree.max()
        
        // Then
        XCTAssertEqual(max, 20)
    }

    func testSearhingForMinValueBinaryTree() {
        // Given
        let tree = testTree
        
        // When
        let min = tree.min()
        
        // Then
        XCTAssertEqual(min, 2)
    }
    
    func testSearhingForBeforeNodeInBinaryTree() {
        // Given
        let tree = testTree
        let node = testTree.root?.left?.right?.right?.left // val = 9
        
        // When
        let preNodeVal = tree.beforeNode(node!)
        
        // Then
        XCTAssertEqual(preNodeVal, 7)
    }
    
    func testSearhingForBeforeMinNodeInBinaryTree() {
        // Given
        let tree = testTree
        let node = testTree.root?.left?.left?.left // val = 2

        // When
        let preNodeVal = tree.beforeNode(node!)
        
        // Then
        XCTAssertNil(preNodeVal)
    }

    func testSearhingForAfterNodeInBinaryTree() {
        // Given
        let tree = testTree
        let node = testTree.root?.left?.right?.right // val = 13
        
        // When
        let postNodeVal = tree.afterNode(node!)
        
        // Then
        XCTAssertEqual(postNodeVal, 15)
    }
    
    func testSearhingForAfterMaxNodeInBinaryTree() {
        // Given
        let tree = testTree
        let node = testTree.root?.right?.right // val = 20
        
        // When
        let postNodeVal = tree.afterNode(node!)
        
        // Then
        XCTAssertNil(postNodeVal)
    }
    
    func testAddValueToBinaryTree() {
        // Given
        let tree = testTree
        let valueToInsert = 10
        
        // When
        let _ = tree.insertValue(valueToInsert)
        
        // Then
        XCTAssertEqual(tree.root?.left?.right?.right?.left?.right?.data, 10)
    }
    
    // Test is useless as assert test, just to check average complexity of insertions
    func testAddRandomValuesToEmptyBinaryTree() {
        // Given
        var tree = SearchBinaryTreeImpl<Int>()
        
        // When
        var accum = 0.0
        for _ in (0..<10) {
            tree = SearchBinaryTreeImpl<Int>()
            for i in (0..<105) {
                if i >= 95 {
                    accum += Double(tree.insertValue(Int(arc4random_uniform(100))))
                } else {
                    let _ = tree.insertValue(Int(arc4random_uniform(100)))
                }
            }
        }
        
        print ("time to insert random value: \(accum/100.0), ideal: \(log2(100.0))");
        
        // Then
        XCTAssertNotNil(tree.root)
    }
    
    func testRemoveLastNodeFromBinaryTree() {
        // Given
        let tree = testTree
        let nodeToRemove = tree.root?.left?.left?.left // 2
        
        // When
        tree.deleteNode(nodeToRemove!)
        
        // Then
        XCTAssertNil(tree.root?.left?.left?.left)
    }
    
    func testRemoveMiddleNodeFromBinaryTree() {
        // Given
        let tree = testTree
        let nodeToRemove = tree.root?.left?.left // 3
        
        // When
        tree.deleteNode(nodeToRemove!)
        
        // Then
        XCTAssertEqual(tree.root?.left?.left?.data, 2)
        XCTAssertEqual(tree.root?.left?.left?.right?.data, 4)
    }
    
    func testRemoveRootNodeFromBinaryTree() {
        // Given
        let tree = testTree
        let nodeToRemove = tree.root // 15
        
        // When
        tree.deleteNode(nodeToRemove!)
        
        // Then
        XCTAssertEqual(tree.root?.data, 13)
        XCTAssertEqual(tree.root?.left?.right?.right?.data, 9)
    }
    
}
