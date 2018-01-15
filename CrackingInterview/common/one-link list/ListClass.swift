//
//  ListClass.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 06/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

/* Implementation of one link list like a convenient class */
protocol List: class {
    associatedtype T: Comparable
    var root: OneLinkListNode<T>? {get}
    var tail: OneLinkListNode<T>? {get}

    init()
    
    // complexity O(n)
    init(with array: Array<T>)
    
    // complexity O(1)
    func addNodeAfterTail(_ node: OneLinkListNode<T>)
    
    // complexity O(1)
    func addNodeBeforeRoot(_ node: OneLinkListNode<T>)

    // complexity O(1)
    func insertNode(_ node: OneLinkListNode<T>, after: OneLinkListNode<T>)
    
    // complexity O(n)
    func getNode(at index: Int) -> OneLinkListNode<T>?

    // complexity O(n)
    func removeNode(at index: Int)
    
    // complexity O(1)
    func removeNodeAfter(node: OneLinkListNode<T>)

    // complexity O(n)
    func count() -> Int
}

class ListImpl<T: Equatable & Comparable>: List {
    var root: OneLinkListNode<T>?
    var tail: OneLinkListNode<T>?
    
    required init() {
    }
    
    required init(with array: Array<T>) {
        var currentNode: OneLinkListNode<T>? = nil
        for val in array {
            if root == nil {
                root = OneLinkListNode(val)
                tail = root
                currentNode = root
            } else {
                let tempNode = OneLinkListNode(val)
                currentNode?.link = tempNode
                currentNode = tempNode
                tail = tempNode
            }
        }
    }
 
    func addNodeAfterTail(_ node: OneLinkListNode<T>) {
        guard let tail = tail else {
            self.root = node
            self.tail = node
            return
        }
        
        tail.link = node
        self.tail = node
    }
    
    func addNodeBeforeRoot(_ node: OneLinkListNode<T>) {
        guard let root = root else {
            self.root = node
            self.tail = node
            return
        }
        
        node.link = root
        self.root = node
    }
    
    func insertNode(_ node: OneLinkListNode<T>, after: OneLinkListNode<T>) {
        node.link = after.link
        after.link = node
        if after === tail {
            tail = node
        }
        
        if node.link === root {
            root = node
        }
    }
    
    func getNode(at index: Int) -> OneLinkListNode<T>? {
        var counter: Int = 0
        var nodeAtIndex: OneLinkListNode<T>? = nil
        
       iterateThroughList { node in
             if counter == index {
                nodeAtIndex = node
                return true
            }
            counter += 1
            return false
        }
        
        return nodeAtIndex
    }
    
    func removeNode(at index: Int) {
        guard index != 0 else {
            if root === tail {
                tail = nil
            }
            root = root?.link
            return
        }
        
        let previousNode = getNode(at: index - 1)
        let nodeToRemove = previousNode?.link
        
        previousNode?.link = nodeToRemove?.link
        if nodeToRemove === tail {
            tail = previousNode
        }
    }

    func removeNodeAfter(node: OneLinkListNode<T>) {
        if node.link === tail {
            tail = node
        }
        
        if node.link === root {
            root = node.link?.link
        }

        node.link = node.link?.link
    }

    func count() -> Int {
        var counter: Int = 0
        
        iterateThroughList { node in
            counter += 1
            return false
        }
        
        return counter
    }
    
    func iterateThroughList(with closure: (OneLinkListNode<T>) -> Bool) {
        guard let root = root else {
            return
        }
        
        var currentNode: OneLinkListNode<T>? = root
        
        while currentNode != nil {
            if let currentNode = currentNode, closure(currentNode) {
                return
            } 
            
            currentNode = currentNode?.link
        }
    }
 }

extension ListImpl: Equatable {
    static func ==(lhs: ListImpl<T>, rhs: ListImpl<T>) -> Bool {
        var currentLNode: OneLinkListNode<T>? = lhs.root
        var currentRNode: OneLinkListNode<T>? = rhs.root
        
        while currentLNode != nil || currentRNode != nil {
            if let leftCurrentNode = currentLNode,
                let rightCurrentNode = currentRNode,
                leftCurrentNode.data == rightCurrentNode.data {
                
                currentLNode = currentLNode?.link
                currentRNode = currentRNode?.link
            } else {
                return false
            }
        }
        return true
    }
}

extension ListImpl: CustomDebugStringConvertible {
    var debugDescription: String {
        var stringRepresentation: String = ""
        iterateThroughList { (node) -> Bool in
            if stringRepresentation.count > 0 {
                 stringRepresentation.append(", ")
            }
            stringRepresentation.append(String(describing: node.data))
            return false
        }
        return stringRepresentation
    }
    
    
}
