//
//  GraphTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class PrefixTreeTests: XCTestCase {
    func testAddStringsAndFindSubset() {
        // Given
        let strings = ["Artem", "Armen", "Baruh", "Bindjan", "Angel"]
        let prefixTree = PrefixTree(strings: strings)
        
        // When
        let indexes = prefixTree.getAllIndexes(with: "Ar")
        
        // Then
        XCTAssertEqual(indexes, [0, 1])
    }
    
    func testAddStringsAndFindEmptySubset() {
        // Given
        let strings = ["Artem", "Armen", "Baruh", "Bindjan", "Angel"]
        let prefixTree = PrefixTree(strings: strings)
        
        // When
        let indexes = prefixTree.getAllIndexes(with: "Arr")
        
        // Then
        XCTAssertEqual(indexes, [])
    }
    
    func testAddStringsAndFindLongSubset() {
        // Given
        let strings = ["Artem", "Armen", "Baruh", "Bindjan", "Angel"]
        let prefixTree = PrefixTree(strings: strings)
        
        // When
        let indexes = prefixTree.getAllIndexes(with: "Arte")
        
        // Then
        XCTAssertEqual(indexes, [0])
    }
    
    func testAddStringsAndFindFirstLevelSubset() {
        // Given
        let strings = ["Artem", "Armen", "Baruh", "Bindjan", "Angel"]
        let prefixTree = PrefixTree(strings: strings)
        
        // When
        let indexes = prefixTree.getAllIndexes(with: "A")
        
        // Then
        XCTAssertEqual(indexes, [0, 1, 4])
    }
    
}
