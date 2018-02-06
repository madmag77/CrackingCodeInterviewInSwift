//
//  Graph.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 23/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

class GraphNode<T: Comparable>: Comparable {
    static func <(lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func ==(lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
    
    let data: T
    var children: Array<GraphNode<T>> = Array<GraphNode<T>>()
    var visited: Bool = false
    var pathLength = 0
    
    init(_ data: T) {
        self.data = data
    }
}

protocol Graph {
    associatedtype T: Comparable
    var nodes: Array<GraphNode<T>> {get set}

}

class GraphImpl<T: Comparable>: Graph {
    var nodes: Array<GraphNode<T>> = Array<GraphNode<T>>()
    
    // Depth first search - In closure we pass current node and wait back for Stop signal
    public func dfs(doWithEveryNode: (GraphNode<T>) -> (Bool)) {
        for child in nodes {
            dfs(from: child, doWithEveryNode: doWithEveryNode)
        }
    }
    
    // Breadth first search in Graph - In closure we pass current node and wait back for Stop signal
    public func bfs(doWithEveryNode: (GraphNode<T>) -> (Bool)) {
        
        let queue = QueueImpl<GraphNode<T>>()
        for node in nodes {
            queue.push(node)
        }
        
        bfs(with: queue,
            doWithEveryNode: doWithEveryNode)
    }

    // Breadth first search from one GraphNode - In closure we pass current node and wait back for Stop signal
    public func bfs(from node: GraphNode<T>,
                    doWithEveryNode: (GraphNode<T>) -> (Bool)) {
        let queue = QueueImpl<GraphNode<T>>()
        queue.push(node)
        
        bfs(with: queue,
            doWithEveryNode: doWithEveryNode)
    }

    // Depth first search - iteration
    private func dfs(from node: GraphNode<T>,
                    doWithEveryNode: (GraphNode<T>) -> (Bool)) {
        
        // Leaf here it's node that hasn't got any children
        if doWithEveryNode(node) {
            return
        }
        
        node.visited = true
        
        for child in node.children where child.visited == false {
            child.pathLength = node.pathLength + 1
            dfs(from: child, doWithEveryNode: doWithEveryNode)
        }
    }
    
    private func bfs(with queue: QueueImpl<GraphNode<T>>,
                     doWithEveryNode: (GraphNode<T>) -> (Bool)) {
        
        while !queue.isEmpty() {
            let node = queue.pop()
            
            if node.visited {
                continue
            }
            if doWithEveryNode(node) {
                return
            }
            node.visited = true
            
            for childNode in node.children {
                childNode.pathLength = node.pathLength + 1
                queue.push(childNode)
            }
        }
    }
}



