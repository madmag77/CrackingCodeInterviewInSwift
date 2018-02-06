//
//  GraphTests.swift
//  CrackingInterviewTests
//
//  Created by Artem Goncharov on 21/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import XCTest
@testable import CrackingInterview

class GraphTests: XCTestCase {
    lazy var testDirectionedGraph: GraphImpl<Int> = {
        let graph = GraphImpl<Int>()
        
        graph.nodes = [GraphNode(1), GraphNode(3)]
        graph.nodes[0].children = [GraphNode(2), GraphNode(4)]
        graph.nodes[0].children[0].children = [GraphNode(5)]
        graph.nodes[0].children[1].children = [graph.nodes[0].children[0].children[0]]
        graph.nodes[0].children[0].children[0].children = [graph.nodes[0].children[1]]
        
        graph.nodes[1].children = [graph.nodes[0].children[0].children[0], GraphNode(6)]
        graph.nodes[1].children[1].children = [graph.nodes[1].children[1]]
        
        return graph
    }()
    
    func testDFS() {
        // Given
        let graph = testDirectionedGraph
        
        // When
        var nodesCounter = 0
        graph.dfs(doWithEveryNode: { (node) -> (Bool) in
            nodesCounter += 1
            print("node: \(node.data), pathLength:  \(node.pathLength)")
            return false
        })
        
        // Then
        XCTAssertEqual(nodesCounter, 6)
    }
    
    func testBFS() {
        // Given
        let graph = testDirectionedGraph
        
        // When
        var nodesCounter = 0
        graph.bfs(doWithEveryNode: { (node) -> (Bool) in
            nodesCounter += 1
            print(node.data)
            return false
        })
        
        // Then
        XCTAssertEqual(nodesCounter, 6)
    }
    
    func testBFSFromNode() {
        // Given
        let graph = testDirectionedGraph
        
        // When
        var nodesCounter = 0
        graph.bfs(from: graph.nodes[0],
                  doWithEveryNode: { (node) -> (Bool) in
            nodesCounter += 1
            print("node: \(node.data), pathLength:  \(node.pathLength)")
            return false
        })
        
        // Then
        XCTAssertEqual(nodesCounter, 4)
    }
}
