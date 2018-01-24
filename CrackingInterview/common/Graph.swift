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
    var children: Array<GraphNode<T>>?
    
    init(data: T) {
        self.data = data
    }
}

protocol Graph {
    associatedtype T: Comparable
    var nodes: Array<GraphNode<T>> {get set}

}

class GraphImpl<T: Comparable>: Graph {
    var nodes: Array<GraphNode<T>> = Array<GraphNode<T>>()
}



