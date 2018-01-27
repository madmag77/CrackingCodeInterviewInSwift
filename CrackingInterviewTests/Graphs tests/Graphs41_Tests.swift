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

    func testRouteExists() {
        // Given
        let graph = graphForTesting()
        let node1 = graph.nodes[0]
        let node2 = graph.nodes[0].children[1].children[0]
        
        // When
        let isRouteExisted = tasks.isRouteExistedBetween(node1, node2, in: graph)
        
        // Then
        XCTAssertTrue(isRouteExisted)
    }
    
    func testRouteNonExists() {
        // Given
        let graph = graphForTesting()
        let node1 = graph.nodes[0]
        let node2 = graph.nodes[1]
        
        // When
        let isRouteExisted = tasks.isRouteExistedBetween(node1, node2, in: graph)
        
        // Then
        XCTAssertFalse(isRouteExisted)
    }
    
    func testRouteExistsSameNode() {
        // Given
        let graph = graphForTesting()
        let node1 = graph.nodes[0]
        let node2 = graph.nodes[0]
        
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
        let node1 = GraphNode<Int>(1)
        
        node1.children.append(GraphNode<Int>(2))
        graph.nodes.append(node1)
        
        let node3 = GraphNode<Int>(3)
        let node4 = GraphNode<Int>(4)
        node3.children.append(node4)
        node1.children.append(node3)
        
        let node5 = GraphNode<Int>(5)
        node5.children.append(node4)
        graph.nodes.append(node5)
        
        return graph
    }
}

