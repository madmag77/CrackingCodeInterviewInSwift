//
//  GraphTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class CacheTests: XCTestCase {
    func testLruCache() {
        // Given
        let cacheDepth = 3
        let stringsToPut = ["A", "B", "C", "B", "D", "D", "F"]
        let expectedInCache = ["F", "D", "B"]
        let notExpectedInCache = ["A", "C", "H"]

        // When
        let cache = LruCache<String, String>(cacheDepth: cacheDepth)
        for item in stringsToPut {
            cache.put(item, with: item)
        }
        
        // Then
        XCTAssertEqual(cache.getItem(with: expectedInCache[0]), expectedInCache[0])
        XCTAssertEqual(cache.getItem(with: expectedInCache[1]), expectedInCache[1])
        XCTAssertEqual(cache.getItem(with: expectedInCache[2]), expectedInCache[2])
        XCTAssertNil(cache.getItem(with: notExpectedInCache[0]))
        XCTAssertNil(cache.getItem(with: notExpectedInCache[1]))
        XCTAssertNil(cache.getItem(with: notExpectedInCache[2]))
    }
    
}
