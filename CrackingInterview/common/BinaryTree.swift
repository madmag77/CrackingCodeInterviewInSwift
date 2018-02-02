//
//  BinaryTree.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 30/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

class BinaryNode<T: Comparable> {
    let data: T
    
    var left: BinaryNode<T>?
    var right: BinaryNode<T>?
    weak var parent: BinaryNode<T>?
    
    var visited: Bool = false
    
    init(_ data: T, parent: BinaryNode<T>? = nil) {
        self.data = data
        self.parent = parent
    }
    
    func setLeft(_ data: T) {
        left = BinaryNode(data, parent: self)
    }
    
    func setRight(_ data: T) {
        right = BinaryNode(data, parent: self)
    }
}

protocol BinaryTree: class {
    associatedtype T: Comparable
    func max() -> T
    func min() -> T
    func beforeNode(_ node: BinaryNode<T>) -> T?
    func afterNode(_ node: BinaryNode<T>) -> T?
    
    func insertValue(_ value: T) -> Int
    func deleteNode(_ node: BinaryNode<T>)
}

class BinaryTreeImpl<T: Comparable> {
    var root: BinaryNode<T>?
}

extension BinaryTreeImpl: BinaryTree {
    func max() -> T {
        guard let root = root else {
            fatalError()
        }
        
        var currentNode: BinaryNode<T> = root
        while currentNode.right != nil {
            guard let currentRight = currentNode.right else {
                continue
            }
            currentNode = currentRight
        }
        
        return currentNode.data
    }
    
    func min() -> T {
        guard let root = root else {
            fatalError()
        }
        
        var currentNode: BinaryNode<T> = root
        while currentNode.left != nil {
            guard let currentRight = currentNode.left else {
                continue
            }
            currentNode = currentRight
        }
        
        return currentNode.data
    }
    
    func beforeNode(_ node: BinaryNode<T>) -> T? {
        var currentNode: BinaryNode<T>? = node
        
        if currentNode?.left != nil {
            return currentNode?.left?.data
        }
        
        while currentNode?.parent != nil {
            if currentNode === currentNode?.parent?.right {
                return currentNode?.parent?.data
            }
            currentNode = currentNode?.parent
        }
        
        return nil
    }
    
    func afterNode(_ node: BinaryNode<T>) -> T? {
        var currentNode: BinaryNode<T>? = node
        
        if currentNode?.right != nil {
            return currentNode?.right?.data
        }
        
        while currentNode?.parent != nil {
            if currentNode === currentNode?.parent?.left {
                return currentNode?.parent?.data
            }
            currentNode = currentNode?.parent
        }
        
        return nil
    }
    
    // Return steps count in order to investigate complexity
    func insertValue(_ value: T) -> Int {
        guard let root = root else {
            self.root = BinaryNode(value)
            return 1
        }
        
        var stepsCnt = 0
        
        var currentNode: BinaryNode<T> = root
        while true {
            stepsCnt += 1
            if value > currentNode.data {
                if currentNode.right != nil {
                    currentNode = currentNode.right!
                } else {
                    currentNode.setRight(value)
                    break
                }
            } else {
                if currentNode.left != nil {
                    currentNode = currentNode.left!
                } else {
                    currentNode.setLeft(value)
                    break
                }
            }
        }
        return stepsCnt
    }
    
    func deleteNode(_ node: BinaryNode<T>) {
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
