//
//  Graphs41_Tests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 24/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class Graphs41_Tests: XCTestCase {
    var tasks: GraphTasks!
    
    override func setUp() {
        super.setUp()
        tasks = GraphTasks()
    }
    
    override func tearDown() {
        tasks = nil
        super.tearDown()
    }

    func _testUnsorted() {
        // Given
        let graph = graphForTesting()
        let node1 = graph.nodes[0]
        let node2 = graph.nodes[3]
        
        // When
        let isRouteExisted = tasks.isRouteExistedBetween(node1, node2, in: graph)
        
        // Then
        XCTAssertTrue(isRouteExisted)
    }
    
    // 1->2
    // Y
    // 3->4<-5
    private func graphForTesting() -> GraphImpl<Int> {
        let graph = GraphImpl<Int>()
        graph.nodes.append(GraphNode<Int>(1))
        return graph
    }
}

