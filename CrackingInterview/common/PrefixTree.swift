//
//  PrefixTree.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 12/03/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

class PrefixNode: Comparable {
    static func <(lhs: PrefixNode, rhs: PrefixNode) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func ==(lhs: PrefixNode, rhs: PrefixNode) -> Bool {
        return lhs.data == rhs.data
    }
    
    var value: [Int]
    let data: Character
    var children: Array<PrefixNode> = Array<PrefixNode>()
    
    init(symbol: Character, value: [Int]) {
        self.value = value
        self.data = symbol
    }
}

class PrefixTree {
    var graphRoot: PrefixNode = PrefixNode(symbol: Character(" "), value: [])
    
    init(strings: [String]) {
        buildTree(from: strings)
    }
    
    public func addString(_ string: String, value: Int) {
        var currentNode: PrefixNode = graphRoot
        
        for symbol in string {
            if let node = child(of: currentNode, with: symbol) {
                currentNode = node
                currentNode.value.append(value)
            } else {
                let node = PrefixNode(symbol: symbol, value: [value])
                currentNode.children.append(node)
                currentNode = node
            }
        }
    }
    
    public func getAllIndexes(with prefix: String) -> [Int] {
        var currentNode: PrefixNode = graphRoot
        
        for symbol in prefix {
            if let node = child(of: currentNode, with: symbol) {
                currentNode = node
            } else {
                return []
            }
        }
        
        return currentNode.value
    }
    
    private func buildTree(from strings: [String]) {
        var index = 0
        for string in strings {
            defer { index += 1 }
            addString(string, value: index)
        }
    }
    
    private func child(of node: PrefixNode,
                                    with symbol: Character) ->  PrefixNode? {
        for child in node.children {
            if child.data == symbol {
                return child
                
            }
        }
        return nil
    }
    
}
