//
//  SearchBinaryTreeTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class RBTreeTests: XCTestCase {
    lazy var testProperRBTree: RBTreeImpl<Int> = {
        let tree = RBTreeImpl<Int>()
        
        tree.root = BinaryNode(26)
        tree.root?.color = .Black
        
        tree.root?.setLeft(17)
        tree.root?.left?.color = .Red
        tree.root?.setRight(41)
        tree.root?.right?.color = .Black
        
        // Parent 26-17
        tree.root?.left?.setLeft(14)
        tree.root?.left?.left?.color = .Black
        tree.root?.left?.setRight(21)
        tree.root?.left?.right?.color = .Black

        // Parent 26-41
        tree.root?.right?.setLeft(30)
        tree.root?.right?.left?.color = .Red
        tree.root?.right?.setRight(47)
        tree.root?.right?.right?.color = .Black

        // Parent 26-17-14
        tree.root?.left?.left?.setLeft(10)
        tree.root?.left?.left?.left?.color = .Red
        tree.root?.left?.left?.setRight(16)
        tree.root?.left?.left?.right?.color = .Black
        
        // Parent 26-17-21
        tree.root?.left?.right?.setLeft(19)
        tree.root?.left?.right?.left?.color = .Black
        tree.root?.left?.right?.setRight(23)
        tree.root?.left?.right?.right?.color = .Black

        // Parent 26-41-30
        tree.root?.right?.left?.setLeft(28)
        tree.root?.right?.left?.left?.color = .Black
        tree.root?.right?.left?.setRight(38)
        tree.root?.right?.left?.right?.color = .Black
        
        // Parent 26-17-14-10
        tree.root?.left?.left?.left?.setLeft(7)
        tree.root?.left?.left?.left?.left?.color = .Black
        tree.root?.left?.left?.left?.setRight(12)
        tree.root?.left?.left?.left?.right?.color = .Black
        
        // Parent 26-17-14-16
        tree.root?.left?.left?.right?.setLeft(16)
        tree.root?.left?.left?.right?.left?.color = .Red
        
        // Parent 26-17-21-19
        tree.root?.left?.right?.left?.setRight(20)
        tree.root?.left?.right?.left?.right?.color = .Red

        // Parent 26-41-30-38
        tree.root?.right?.left?.right?.setLeft(35)
        tree.root?.right?.left?.right?.left?.color = .Red
        tree.root?.right?.left?.right?.setRight(39)
        tree.root?.right?.left?.right?.right?.color = .Red

        // Parent 26-17-14-10-7
        tree.root?.left?.left?.left?.left?.setLeft(3)
        tree.root?.left?.left?.left?.left?.left?.color = .Red

        return tree
    }()

    lazy var testImProperRBTree: RBTreeImpl<Int> = {
        let tree = RBTreeImpl<Int>()
        
        tree.root = BinaryNode(26)
        tree.root?.color = .Black
        
        tree.root?.setLeft(17)
        tree.root?.left?.color = .Red
        tree.root?.setRight(41)
        tree.root?.right?.color = .Black
        
        // Parent 26-17
        tree.root?.left?.setLeft(14)
        tree.root?.left?.left?.color = .Black
        tree.root?.left?.setRight(21)
        tree.root?.left?.right?.color = .Black
        
        // Parent 26-41
        tree.root?.right?.setLeft(30)
        tree.root?.right?.left?.color = .Red
        tree.root?.right?.setRight(47)
        tree.root?.right?.right?.color = .Black
        
        // Parent 26-17-14
        tree.root?.left?.left?.setLeft(10)
        tree.root?.left?.left?.left?.color = .Red
        tree.root?.left?.left?.setRight(16)
        tree.root?.left?.left?.right?.color = .Black
        
        // Parent 26-17-21
        tree.root?.left?.right?.setLeft(19)
        tree.root?.left?.right?.left?.color = .Black
        tree.root?.left?.right?.setRight(23)
        tree.root?.left?.right?.right?.color = .Black
        
        // Parent 26-41-30
        tree.root?.right?.left?.setLeft(28)
        tree.root?.right?.left?.left?.color = .Red
        tree.root?.right?.left?.setRight(38)
        tree.root?.right?.left?.right?.color = .Black
        
        // Parent 26-17-14-10
        tree.root?.left?.left?.left?.setLeft(7)
        tree.root?.left?.left?.left?.left?.color = .Black
        tree.root?.left?.left?.left?.setRight(12)
        tree.root?.left?.left?.left?.right?.color = .Black
        
        // Parent 26-17-14-16
        tree.root?.left?.left?.right?.setLeft(16)
        tree.root?.left?.left?.right?.left?.color = .Red
        
        // Parent 26-17-21-19
        tree.root?.left?.right?.left?.setRight(20)
        tree.root?.left?.right?.left?.right?.color = .Red
        
        // Parent 26-41-30-38
        tree.root?.right?.left?.right?.setLeft(35)
        tree.root?.right?.left?.right?.left?.color = .Red
        tree.root?.right?.left?.right?.setRight(39)
        tree.root?.right?.left?.right?.right?.color = .Red
        
        // Parent 26-17-14-10-7
        tree.root?.left?.left?.left?.left?.setLeft(3)
        tree.root?.left?.left?.left?.left?.left?.color = .Red

        return tree
    }()
    
    func testBlackHeightOfRoot() {
        // Given
        let tree = testProperRBTree
        let node = tree.root
        
        // When
        let blackHeight = tree.blackHeightOfNode(node!)
        
        // Then
        XCTAssertEqual(blackHeight, 0)
    }
    
    func testBlackHeight() {
        // Given
        let tree = testProperRBTree
        let node = tree.root?.left?.left?.left?.left?.left
        
        // When
        let blackHeight = tree.blackHeightOfNode(node!)
        
        // Then
        XCTAssertEqual(blackHeight, 2)
    }
    
    func testBlackHeightOfBlackNode() {
        // Given
        let tree = testProperRBTree
        let node = tree.root?.left?.left?.left?.right
        
        // When
        let blackHeight = tree.blackHeightOfNode(node!)
        
        // Then
        XCTAssertEqual(blackHeight, 2)
    }
    
    func testRedNodeHasBlackChildren() {
        // Given
        let tree = testProperRBTree
        let nodeToCheck = tree.root?.left
        
        // When
        let check = tree.checkIfRedNodeHasBlackChildren(nodeToCheck!)
        
        // Then
        XCTAssertTrue(check)
    }
    
    func testBlackNodeAnyChildren() {
        // Given
        let tree = testProperRBTree
        let nodeToCheck = tree.root?.left?.left
        
        // When
        let check = tree.checkIfRedNodeHasBlackChildren(nodeToCheck!)
        
        // Then
        XCTAssertTrue(check)
    }
    
    func testRedNodeHasNotBlackChildren() {
        // Given
        let tree = testImProperRBTree
        let nodeToCheck = tree.root?.right?.left
        
        // When
        let check = tree.checkIfRedNodeHasBlackChildren(nodeToCheck!)
        
        // Then
        XCTAssertFalse(check)
    }
    
    func testIfProperRBTree() {
        // Given
        let tree = testProperRBTree
        
        // When
        let properRBTree = tree.isProperRedBlack()

        // Then
        XCTAssertTrue(properRBTree)
    }
    
    func testIfImProperRBTree() {
        // Given
        let tree = testImProperRBTree
        
        // When
        let properRBTree = tree.isProperRedBlack()
        
        // Then
        XCTAssertFalse(properRBTree)
    }
    
    func testRotateLeftRBTree() {
        // Given
        let tree = testProperRBTree
        let nodeToRotate =  tree.root?.right?.left
        
        // When
        tree.rotateLeft(node: nodeToRotate!)
        
        // Then
        XCTAssertEqual(tree.root?.right?.left?.data, 38)
        XCTAssertEqual(tree.root?.right?.left?.left?.data, 30)
        XCTAssertEqual(tree.root?.right?.left?.right?.data, 39)
        XCTAssertEqual(tree.root?.right?.left?.left?.left?.data, 28)
        XCTAssertEqual(tree.root?.right?.left?.left?.right?.data, 35)
    }
    
    func testRotateRightRBTree() {
        // Given
        let tree = testProperRBTree
        let nodeToRotate = tree.root?.right?.left
        
        // When
        tree.rotateLeft(node: nodeToRotate!)
        tree.rotateRight(node: (tree.root?.right?.left)!)

        // Then
        XCTAssertEqual(tree.root?.right?.left?.data, testProperRBTree.root?.right?.left?.data)
        XCTAssertEqual(tree.root?.right?.left?.left?.data, testProperRBTree.root?.right?.left?.left?.data)
        XCTAssertEqual(tree.root?.right?.left?.right?.data, testProperRBTree.root?.right?.left?.right?.data)
        XCTAssertEqual(tree.root?.right?.left?.left?.left?.data, testProperRBTree.root?.right?.left?.left?.left?.data)
        XCTAssertEqual(tree.root?.right?.left?.left?.right?.data, testProperRBTree.root?.right?.left?.left?.right?.data)
    }
}
