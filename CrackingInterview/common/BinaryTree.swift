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
    
    func insertValue(_ value: T)
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
    
    func insertValue(_ value: T) {
        guard let root = root else {
            fatalError()
        }
        
        var currentNode: BinaryNode<T> = root
        while true {
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
    }
    
    func deleteNode(_ node: BinaryNode<T>) {
        
    }
}
