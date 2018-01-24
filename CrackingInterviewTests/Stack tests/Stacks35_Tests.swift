//
//  Stacks35_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Stacks35_Tests: XCTestCase {
    var tasks: StackTasks!
    
    override func setUp() {
        super.setUp()
        tasks = StackTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func testUnsorted() {
        // Given
        let arrayToSort = [5, 2, 3, 6, 1, 4]
        let arrayToCompareWith = [1, 2, 3, 4, 5, 6]
        let stack = StackImpl<Int>()
        for i in arrayToSort {
            stack.push(i)
        }
        
        // When
        tasks.sortStack(stack)
        
        // Then
        var sortedArray = [Int]()
        while !stack.isEmpty() {
            sortedArray.append(stack.pop())
        }
        
        XCTAssertEqual(sortedArray, arrayToCompareWith)
    }
    
    func testSorted() {
        // Given
        let arrayToSort = [6, 5, 4, 3, 2, 1]
        let arrayToCompareWith = [1, 2, 3, 4, 5, 6]
        let stack = StackImpl<Int>()
        for i in arrayToSort {
            stack.push(i)
        }
        
        // When
        tasks.sortStack(stack)
        
        // Then
        var sortedArray = [Int]()
        while !stack.isEmpty() {
            sortedArray.append(stack.pop())
        }
        
        XCTAssertEqual(sortedArray, arrayToCompareWith)
    }

    func testEmpty() {
        // Given
        let stack = StackImpl<Int>()
        
        // When
        tasks.sortStack(stack)
        
        // Then
        XCTAssertNotNil(stack)
    }

    func testOneElement() {
        // Given
        let arrayToSort = [6]
        let arrayToCompareWith = [6]
        let stack = StackImpl<Int>()
        for i in arrayToSort {
            stack.push(i)
        }
        
        // When
        tasks.sortStack(stack)
        
        // Then
        var sortedArray = [Int]()
        while !stack.isEmpty() {
            sortedArray.append(stack.pop())
        }
        
        XCTAssertEqual(sortedArray, arrayToCompareWith)
    }
    
    func testSameElements() {
        // Given
        let arrayToSort = [6, 5, 6, 5, 5]
        let arrayToCompareWith = [5, 5, 5, 6, 6]
        let stack = StackImpl<Int>()
        for i in arrayToSort {
            stack.push(i)
        }
        
        // When
        tasks.sortStack(stack)
        
        // Then
        var sortedArray = [Int]()
        while !stack.isEmpty() {
            sortedArray.append(stack.pop())
        }
        
        XCTAssertEqual(sortedArray, arrayToCompareWith)
    }
}

