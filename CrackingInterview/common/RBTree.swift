//
//  RBTree.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 30/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

class RBTreeImpl<T: Comparable>: SearchBinaryTreeImpl<T> {

    override func insertValue(_ value: T) -> Int {
        guard let root = root else {
            self.root = BinaryNode(value)
            return 1
        }
        
        var stepsCnt = 0
        var newNode: BinaryNode<T>?
        
        var currentNode: BinaryNode<T> = root
        while true {
            stepsCnt += 1
            if value > currentNode.data {
                if currentNode.right != nil {
                    currentNode = currentNode.right!
                } else {
                    currentNode.setRight(value)
                    newNode = currentNode.right
                    break
                }
            } else {
                if currentNode.left != nil {
                    currentNode = currentNode.left!
                } else {
                    currentNode.setLeft(value)
                    newNode = currentNode.left
                    break
                }
            }
        }
        
        newNode?.color = .Red
        
        fixTreeStartFrom(newNode!)
        
        return stepsCnt
    }
    
    private func fixTreeStartFrom(_ node: BinaryNode<T>) {
        
    }
    
    override func deleteNode(_ node: BinaryNode<T>) {
        // Easiest option
        if node.left == nil && node.right == nil {
            if node.parent?.left === node {
                node.parent?.left = nil
                node.parent = nil
            } else {
                node.parent?.right = nil
                node.parent = nil
            }
            
            if node === root {
                root = nil
            }
            
            return
        }
        
        var currentNode: BinaryNode<T>
        if let left = node.left {
            currentNode = left
            while currentNode.right != nil {
                currentNode = currentNode.right!
            }
            
            if currentNode.parent !== node {
                currentNode.parent?.right = currentNode.left
            }
            
            copy(from: node, to: currentNode)
        } else {
            currentNode = node.right!
            while currentNode.left != nil {
                currentNode = currentNode.left!
            }

            if currentNode.parent !== node {
                currentNode.parent?.left = currentNode.right
            }

            copy(from: node, to: currentNode)
        }
    }
    
    // Check if tree is really a Red - Black tree
    public func isProperRedBlack() -> Bool {
        guard let root = root else { return false }
        
        // First condition is implied because we have enum with only two cases
        
        // Second condition root is Black
        if root.color == .Red { return false }
        
        // Third condition is implied because real leaf is just abstraction here

        var properRBTree = true
        var stop = false
        var blackHeight = 0
        
        // Find all leaves using dfs and check black height of each of them
        dfs(from: root) { node, isLeaf in
            guard !stop else { return stop }
            
            // Fourth condition check
            if !isLeaf && !checkIfRedNodeHasBlackChildren(node) {
                stop = true
                properRBTree = false
            } else if isLeaf {
                
                // Fifth condition - same black height of all leafs
                let height = blackHeightOfNode(node)
                if blackHeight == 0 {
                    blackHeight = height
                } else if blackHeight != height {
                    stop = true
                    properRBTree = false
                }
            }
            
            return stop
        }
        
        return properRBTree
    }
    
    public func checkIfRedNodeHasBlackChildren(_ node: BinaryNode<T>) -> Bool {
        return node.color == .Red ? node.left?.color != .Red && node.right?.color != .Red : true
    }
    
    // Iterate through parents to the root and sum black nodes
    public func blackHeightOfNode(_ node: BinaryNode<T>) -> Int {
        var height = 0
        var currentNode: BinaryNode<T>? = node
        while currentNode !== root {
            if currentNode?.color == .Black {
                height += 1
            }
            currentNode = currentNode?.parent
        }
        
        return height
    }
    
    // Depth first search - In closure we pass current node and flag that node is Leaf and wait back for Stop signal
    private func dfs(from node: BinaryNode<T>,
                     doWithEveryNode: (BinaryNode<T>, Bool) -> (Bool)) {
        
        // Leaf here it's node that hasn't got any children
        if doWithEveryNode(node, node.left == nil && node.right == nil) {
            return
        }
        
        if let left = node.left {
            dfs(from: left,
                doWithEveryNode: doWithEveryNode)
        }
        
        if let right = node.right {
            dfs(from: right,
                doWithEveryNode: doWithEveryNode)
        }
    }
    
    public func rotateLeft(node: BinaryNode<T>) {
        guard let right = node.right else {
            fatalError()
        }
        
        node.right = right.left
        right.left = node
        right.parent = node.parent
        node.parent = right
        
        if (node === root) {
            root = right
        } else {
            if right.parent?.left === node {
                right.parent?.left = right
            } else {
                right.parent?.right = right
            }
        }
    }
    
    public func rotateRight(node: BinaryNode<T>) {
        guard let left = node.left else {
            fatalError()
        }
        
        node.left = left.right
        left.right = node
        left.parent = node.parent
        node.parent = left
        
        if (node === root) {
            root = left
        } else {
            if left.parent?.right === node {
                left.parent?.right = left
            } else {
                left.parent?.left = left
            }
        }
    }
    
    private func copy(from nodeFrom: BinaryNode<T>, to nodeTo: BinaryNode<T>) {
        nodeTo.left = nodeFrom.left !== nodeTo ? nodeFrom.left : nil
        nodeTo.right = nodeFrom.right !== nodeTo ? nodeFrom.right : nil
        nodeTo.parent = nodeFrom.parent
        if nodeFrom.parent?.left === nodeFrom {
            nodeFrom.parent?.left = nodeTo
        } else {
            nodeFrom.parent?.right = nodeTo
        }
        
        if nodeFrom === root {
            root = nodeTo
        }

    }
}
