//
//  Graphs.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 08/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

// Chapter 4
class GraphTasks {
    
}

extension GraphTasks {
    /* 4.1 For directional graph check whether exists route between two nodes
     * Complexity: O(n).
     */
    func isRouteExistedBetween(_ node1: GraphNode<Int>, _ node2: GraphNode<Int>, in graph: GraphImpl<Int>) -> Bool {
        guard node1 !== node2 else {
            return true
        }
        
        // Just breadth first search through the graph starting from node1's children
        let queue = QueueImpl<GraphNode<Int>>()
        for node in node1.children {
            queue.push(node)
        }
        
        while !queue.isEmpty() {
            let node = queue.pop()
            if node === node2 {
                return true
            }
            
            if node.visited {
                continue
            }
            node.visited = true
            
            for childNode in node.children {
                queue.push(childNode)
            }
        }
    
        return false
    }
}

extension GraphTasks {
    /* 4.2 Using given sorted array of Ints build search binary tree with mminimal height
     * Complexity: O(?).
     */
    func searchBinaryTreeFrom(array: [Int]) -> GraphImpl<Int> {
        let graph = GraphImpl<Int>()

        guard array.count > 0 else {
            return graph
        }
        
        guard array.count > 1 else {
            graph.nodes.append(GraphNode<Int>(array[0]))
            return graph
        }
        
        var currentRoot = GraphNode<Int>(array[1])
        currentRoot.children.append(GraphNode<Int>(array[0]))
        currentRoot.children.append(GraphNode<Int>(array[2]))

        return graph
    }
}

