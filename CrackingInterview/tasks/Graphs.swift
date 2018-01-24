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
     * Complexity: O(?).
     */
    func isRouteExistedBetween(_ node1: GraphNode<Int>, _ node2: GraphNode<Int>, in graph: GraphImpl<Int>) -> Bool {
        let queue1 = QueueImpl<GraphNode<Int>>()
        var counter = 0
        for node in graph.nodes {
            queue1.push(node)
            counter += 1
            print(node.data)
        }
        
        while !queue1.isEmpty() {
            let node = queue1.pop()
            for childNode in node.children ?? [] {
                queue1.push(childNode)
                print(childNode.data)
                counter += 1
                if counter > 10 {
                    return false
                }
            }
        }
    
        return false
    }
}
