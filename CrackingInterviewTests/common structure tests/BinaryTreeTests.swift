//
//  BinaryTreeTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class BinaryTreeTests: XCTestCase {
    lazy var testTree: BinaryTreeImpl<Int> = {
        let tree = BinaryTreeImpl<Int>()
        
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
    
    lazy var testTreeWithEqualNodes: BinaryTreeImpl<Int> = {
        let tree = BinaryTreeImpl<Int>()
        
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
        let tree = BinaryTreeImpl<Int>()
        
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
        tree.insertValue(valueToInsert)
        
        // Then
        XCTAssertEqual(testTree.root?.left?.right?.right?.left?.right?.data, 10)
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
