//
//  ArraysAndStringsTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class ArraysAndStrings16_Tests: XCTestCase {
    var tasks: ArraysAndStringsTasks!
    
    override func setUp() {
        super.setUp()
        tasks = ArraysAndStringsTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }
    
    func testSymbolCounts() {
        // Given
        let stringToCompress = "aaaaauuuruuQQQQFFFFFF"
        
        // When
        let symbolCounts: [Character: Int] = tasks.symbolCountsDictionary(from: stringToCompress)
        
        // Then
        XCTAssertEqual(symbolCounts.keys.count, 5)
        XCTAssertEqual(symbolCounts["a"], 5)
        XCTAssertEqual(symbolCounts["u"], 5)
        XCTAssertEqual(symbolCounts["r"], 1)
        XCTAssertEqual(symbolCounts["Q"], 4)
        XCTAssertEqual(symbolCounts["F"], 6)
    }

    func testGoodCompression() {
        // Given
        let stringToCompress = "aaaaauuuruuQQQQFFFFFF"
        
        // When
        let compressedString = tasks.compress(string: stringToCompress)
        
        // Then
        XCTAssertEqual(compressedString, "a5u3r1u2Q4F6")
    }
    
    func testNotCompressed() {
        // Given
        let stringToCompress = "abcde"
        
        // When
        let compressedString = tasks.compress(string: stringToCompress)
        
        // Then
        XCTAssertEqual(compressedString, "abcde")
    }
    
    func testNotCompressedEdgeCase() {
        // Given
        let stringToCompress = "aaaaabcde"
        
        // When
        let compressedString = tasks.compress(string: stringToCompress)
        
        // Then
        XCTAssertEqual(compressedString, "aaaaabcde")
    }
    
    func testPerformanceCompression() {
        var stringToCompress: String = ""
        let letters: NSMutableString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        for _ in (0..<100000) {
            stringToCompress.append("\(Character( UnicodeScalar( letters.character(at: Int(arc4random_uniform(UInt32(letters.length)))))!))")
        }
        
        self.measure {
            let _ = tasks.compress(string: stringToCompress)
        }
    }
    
}
