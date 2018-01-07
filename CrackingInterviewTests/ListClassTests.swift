//
//  ListClassTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ListClassTests: XCTestCase {
    
    func testEmptyListRootIsNull() {
        // Given
        let oneLinkList = ListImpl<Int>()
        
        // When
        
        // Then
        XCTAssertNil(oneLinkList.root)
    }
    
    func testOneRootHasLinkNull() {
        // Given
        let oneLinkList = ListImpl<String>()
        let rootName = "root"

        // When
        oneLinkList.addNodeAfterTail(OneLinkListNode(rootName))
        
        // Then
        XCTAssertNotNil(oneLinkList.root)
        XCTAssertNil(oneLinkList.root?.link)
        XCTAssertEqual(oneLinkList.root?.data, rootName)
    }
    
    func testCanAddNode() {
        // Given
        let oneLinkList = ListImpl<String>()
        let rootName = "root"
        let childName = "child"
        
        // When
        oneLinkList.addNodeAfterTail(OneLinkListNode(rootName))
        oneLinkList.addNodeAfterTail(OneLinkListNode(childName))

        // Then
        XCTAssertNotNil(oneLinkList.root?.link)
        XCTAssertEqual(oneLinkList.root?.data, rootName)
        XCTAssertEqual(oneLinkList.root?.link?.data, childName)
    }
    
    func testCanAddTwoNodes() {
        // Given
        let oneLinkList = ListImpl<String>()
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        // When
        oneLinkList.addNodeBeforeRoot(OneLinkListNode(rootName))
        oneLinkList.addNodeAfterTail(OneLinkListNode(childName))
        oneLinkList.addNodeAfterTail(OneLinkListNode(subChildName))

        // Then
        XCTAssertNotNil(oneLinkList.root?.link)
        XCTAssertEqual(oneLinkList.root?.data, rootName)
        XCTAssertEqual(oneLinkList.root?.link?.data, childName)
        XCTAssertEqual(oneLinkList.root?.link?.link?.data, subChildName)
    }
    
    func testMakeListFromArray() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        
        // When
        let list = ListImpl(with: array)
        
        // Then
        XCTAssertEqual(list.root?.data, 2)
        XCTAssertEqual(list.root?.link?.data, 6)
        XCTAssertEqual(list.root?.link?.link?.data, 8)
    }

    func testGetNodeByIndex() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)

        // When
        let thirdNode = list.getNode(at: 2)
        
        // Then
        XCTAssertEqual(thirdNode?.data, 8)
    }
    
    func testGetUnexistedNodeByIndex() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        let nonNode = list.getNode(at: 20)
        
        // Then
        XCTAssertNil(nonNode)
    }
    
    func testNodeCount() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)

        // When
         let nodeCount = list.count()
        
        // Then
        XCTAssertEqual(nodeCount, 6)
    }
    
    func testCanInsertNode() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        let valueToInsert = 11
        
        // When
        list.insertNode(OneLinkListNode(valueToInsert), after: list.getNode(at: 2)!)
        
        // Then
        XCTAssertEqual(list.getNode(at: 3)?.data, valueToInsert)
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[3])
    }
    
    func testInsertTailNode() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        let valueToInsert = 11
        
        // When
        list.insertNode(OneLinkListNode(valueToInsert), after: list.getNode(at: 5)!)
        
        // Then
        XCTAssertEqual(list.getNode(at: 6)?.data, valueToInsert)
        XCTAssertEqual(list.tail?.data, valueToInsert)
    }

    func testIterator() {
        // Given
        let list = ListImpl<String>()
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"

        list.addNodeBeforeRoot(OneLinkListNode(rootName))
        list.addNodeAfterTail(OneLinkListNode(childName))
        list.addNodeAfterTail(OneLinkListNode(subChildName))

        // When
        var counter = 0
        list.iterateThroughList { (node) -> Bool in
            counter += 1
            return false
        }
        
        // Then
        XCTAssertEqual(counter, 3)
    }
    
    func testIteratorWithStop() {
        // Given
        let list = ListImpl<String>()
        let rootName = "root"
        let childName = "child"
        let subChildName = "subChildName"
        
        list.addNodeBeforeRoot(OneLinkListNode(rootName))
        list.addNodeAfterTail(OneLinkListNode(childName))
        list.addNodeAfterTail(OneLinkListNode(subChildName))
        
        // When
        var counter = 0
        list.iterateThroughList { (node) -> Bool in
            counter += 1
            return true
        }
        
        // Then
        XCTAssertEqual(counter, 1)
    }
    
    func testRemoveNode() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.removeNode(at: 1)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[0])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[2])
    }
    
    func testRemoveRootNode() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.removeNode(at: 0)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[1])
        XCTAssertEqual(list.root?.data, array[1])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[2])
    }
    
    func testRemoveTailNode() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.removeNode(at: 5)
        
        // Then
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssertNil(list.getNode(at: 4)?.link)
        XCTAssertEqual(list.tail?.data, array[4])
        XCTAssert(list.getNode(at: 4) === list.tail)
    }
    
    func testRemoveOnlyNode() {
        // Given
        let array: Array<Int> = [2]
        let list = ListImpl(with: array)
        
        // When
        list.removeNode(at: 0)
        
        // Then
        XCTAssertNil(list.root)
        XCTAssertNil(list.tail)
        XCTAssertEqual(list.count(), 0)
    }
    
    func testSwapNodes() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 1, to: 3)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[0])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[3])
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[1])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
    }
    
    func testSwapNodesWithRoot() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 0, to: 3)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[3])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[1])
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[0])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssert(list.getNode(at: 0) === list.root)
    }
    
    func testSwapNodesWithAnotherRoot() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 3, to: 0)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[3])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[1])
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[0])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssert(list.getNode(at: 0) === list.root)
    }
    
    func testSwapNodesWithTail() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 3, to: 5)
        
        // Then
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[5])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssertEqual(list.getNode(at: 5)?.data, array[3])
        XCTAssert(list.getNode(at: 5) === list.tail)
    }
    
    func testSwapRootAndTail() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 0, to: 5)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[5])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[1])
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[3])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssertEqual(list.getNode(at: 5)?.data, array[0])
        XCTAssert(list.getNode(at: 5) === list.tail)
        XCTAssert(list.getNode(at: 0) === list.root)
    }
    
    func testSwapTailAndRoot() {
        // Given
        let array: Array<Int> = [2, 6, 8, 0, 1, 4]
        let list = ListImpl(with: array)
        
        // When
        list.swapNode(from: 5, to: 0)
        
        // Then
        XCTAssertEqual(list.getNode(at: 0)?.data, array[5])
        XCTAssertEqual(list.getNode(at: 1)?.data, array[1])
        XCTAssertEqual(list.getNode(at: 2)?.data, array[2])
        XCTAssertEqual(list.getNode(at: 3)?.data, array[3])
        XCTAssertEqual(list.getNode(at: 4)?.data, array[4])
        XCTAssertEqual(list.getNode(at: 5)?.data, array[0])
        XCTAssert(list.getNode(at: 5) === list.tail)
        XCTAssert(list.getNode(at: 0) === list.root)
    }
    
    func testEqualLists() {
        // Given
        let list1 = ListImpl(with: [2, 6, 8, 0, 1, 4])
        let list2 = ListImpl(with: [2, 6, 8, 0, 1, 4])
        
        // When
        let equal = list1 == list2
        
        // Then
        XCTAssertTrue(equal)
    }
    
    func testEqualEmptyLists() {
        // Given
        let list1 = ListImpl<Int>()
        let list2 = ListImpl<Int>()
        
        // When
        let equal = list1 == list2
        
        // Then
        XCTAssertTrue(equal)
    }
    
    func testNonEqualLists() {
        // Given
        let list1 = ListImpl(with: [2, 6, 8, 0, 1, 9])
        let list2 = ListImpl(with: [2, 6, 8, 0, 1, 4])
        
        // When
        let equal = list1 == list2
        
        // Then
        XCTAssertFalse(equal)
    }
    
    func testNonEqualDifferentSizesLists() {
        // Given
        let list1 = ListImpl(with: [2, 6, 8, 0, 1])
        let list2 = ListImpl(with: [2, 6, 8, 0, 1, 4])
        
        // When
        let equal = list1 == list2
        
        // Then
        XCTAssertFalse(equal)
    }
}

