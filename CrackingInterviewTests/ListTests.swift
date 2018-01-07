//
//  ListTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ListTests: XCTestCase {
    
    func testOneRootHasLinkNull() {
        // Given
        let oneLinkListRoot = OneLinkListNode("root")
        
        // When
        
        // Then
        XCTAssertNil(oneLinkListRoot.link)
    }
 
    func testRootHasData() {
        // Given
        let rootName = "root"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)

        // Then
        XCTAssertEqual(oneLinkListRoot.data, rootName)
    }
    
    func testCanAddNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        
        // Then
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, childName)
    }
    
    func testCanAddTwoNodes() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        
        // Then
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, childName)
        XCTAssertEqual(oneLinkListRoot.link?.link?.data, subChildName)
    }
    
    func testGetNodeByIndex() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        let thirdNode = OneLinkList.getNode(index: 2, in: oneLinkListRoot) ?? OneLinkListNode("WRONGNODE")
        
        // Then
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(thirdNode.data, subChildName)
    }
    
    func testGetUnexistedNodeByIndex() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        let nilNode: OneLinkListNode<String>? = OneLinkList.getNode(index: 8, in: oneLinkListRoot)
        
        // Then
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertNil(nilNode)
    }
    
    func testNodeCount() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        let nodeCount = OneLinkList.nodeCount(of: oneLinkListRoot)
        
        // Then
        XCTAssertEqual(nodeCount, 3)
    }
    
    func testCanInsertNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let insertedName = "insertedName"

        // When
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        let secondNode = OneLinkList.getNode(index: 1, in: oneLinkListRoot) ?? OneLinkListNode("WRONGNODE")
        OneLinkList.insertNode(OneLinkListNode(insertedName), afterNode: secondNode)
        
        // Then
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, childName)
        XCTAssertEqual(oneLinkListRoot.link?.link?.data, insertedName)
        XCTAssertEqual(oneLinkListRoot.link?.link?.link?.data, subChildName)
    }
    
    func testIterator() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        var iterator = OneLinkList.getIterator(of: oneLinkListRoot)
        let checkNodeWithIndex = 2
        var counter = 1
        var nameOfFoundNode: String = "DEFAULT"
        
        // When
        while let node: OneLinkListNode<String> = iterator.next() {
            if checkNodeWithIndex == counter {
                nameOfFoundNode = node.data
                break
            }
            counter += 1
        }
        
        // Then
        XCTAssertEqual(nameOfFoundNode, subChildName)
    }
    
    func testIteratorNotFoundNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        var iterator = OneLinkList.getIterator(of: oneLinkListRoot)
        let checkNodeWithIndex = 5
        var counter = 1
        var nameOfFoundNode: String = "DEFAULT"
        
        // When
        while let node: OneLinkListNode<String> = iterator.next() {
            if checkNodeWithIndex == counter {
                nameOfFoundNode = node.data
                break
            }
            counter += 1
        }
        
        // Then
        XCTAssertEqual(nameOfFoundNode, "DEFAULT")
    }
    
    func testDeleteNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        var iterator = OneLinkList.getIterator(of: oneLinkListRoot)
        let checkNodeWithIndex = 1
        var counter = 1
        var foundNode: OneLinkListNode<String> = oneLinkListRoot
        
        while let node: OneLinkListNode<String> = iterator.next() {
            if checkNodeWithIndex == counter {
                foundNode = node
                break
            }
            counter += 1
        }
        
        // When
        let deleteResult = OneLinkList.deleteNode(node: foundNode, in: oneLinkListRoot)
        
        // Then
        XCTAssertTrue(deleteResult)
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, subChildName)
        XCTAssertNil(oneLinkListRoot.link?.link)
    }
    
    func testDeleteLastNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        var iterator = OneLinkList.getIterator(of: oneLinkListRoot)
        let checkNodeWithIndex = 2
        var counter = 1
        var foundNode: OneLinkListNode<String> = oneLinkListRoot
        
        while let node: OneLinkListNode<String> = iterator.next() {
            if checkNodeWithIndex == counter {
                foundNode = node
                break
            }
            counter += 1
        }
        
        // When
        let deleteResult = OneLinkList.deleteNode(node: foundNode, in: oneLinkListRoot)
        
        // Then
        XCTAssertTrue(deleteResult)
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, childName)
        XCTAssertNil(oneLinkListRoot.link?.link)
    }
    
    func testCantDeleteRootNode() {
        // Given
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        let oneLinkListRoot = OneLinkListNode(rootName)
        OneLinkList.addNode(OneLinkListNode(childName), to: oneLinkListRoot)
        OneLinkList.addNode(OneLinkListNode(subChildName), to: oneLinkListRoot)
        
        // When
        let deleteResult = OneLinkList.deleteNode(node: oneLinkListRoot, in: oneLinkListRoot)
        
        // Then
        XCTAssertFalse(deleteResult)
        XCTAssertNotNil(oneLinkListRoot.link)
        XCTAssertEqual(oneLinkListRoot.data, rootName)
        XCTAssertEqual(oneLinkListRoot.link?.data, childName)
        XCTAssertEqual(oneLinkListRoot.link?.link?.data, subChildName)
    }
    
    func testMakeListFromArray() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        
        // When
        let list = OneLinkList.makeList(from: array)
        
        // Then
        XCTAssertEqual(OneLinkList.nodeCount(of: list ?? OneLinkListNode(0)), 6)
        XCTAssertEqual(list?.data, 2)
        XCTAssertEqual(list?.link?.data, 6)
        XCTAssertEqual(list?.link?.link?.data, 8)
    }
}

