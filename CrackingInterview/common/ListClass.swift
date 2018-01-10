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
    func removeNode(previousNode: OneLinkListNode<T>)

    // complexity O(n)
    func swapNode(from indexFrom: Int, to indexTo: Int)

    // complexity O(n)
    func count() -> Int

    // Buble sort complexity O(n*n)
    func sortInPlace()
    
    func iterateThroughList(with closure: (OneLinkListNode<T>) -> Bool)
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

    func removeNode(previousNode: OneLinkListNode<T>) {
        if previousNode.link === tail {
            tail = previousNode
        }
        
        previousNode.link = previousNode.link?.link
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

    func iterateThroughList(from node: OneLinkListNode<T>, with closure: (OneLinkListNode<T>) -> Bool) {
        var currentNode: OneLinkListNode<T>? = node
        
        while currentNode != nil {
            if let currentNode = currentNode, closure(currentNode) {
                return
            }
            
            currentNode = currentNode?.link
        }
    }

    func swapNode(from indexFrom: Int, to indexTo: Int) {
        guard indexFrom != indexTo else {
            return
        }
        
        var fromPreviousNode: OneLinkListNode<T>? = indexFrom == 0 ? root : nil
        var toPreviousNode: OneLinkListNode<T>? = indexTo == 0 ? root : nil
        var counter: Int = 0
        
        iterateThroughList { (node) -> Bool in
            if counter == indexFrom - 1 {
                fromPreviousNode = node
            }
            
            if counter == indexTo - 1 {
                toPreviousNode = node
            }
            
            if fromPreviousNode != nil && toPreviousNode != nil {
                return true
            }
            
            counter += 1
            return false
        }
        
        if fromPreviousNode != nil && toPreviousNode != nil {
            if indexFrom == 0 {
                swapNodeToRoot(toPreviousNode)
            } else if indexTo == 0 {
                swapNodeToRoot(fromPreviousNode)
            } else {
                swapNodes(previousNodeFrom: fromPreviousNode, previousNodeTo: toPreviousNode)
            }
        }
    }
 
    func swapNodeToRoot(_ previousNode: OneLinkListNode<T>?) {
        let tempRoot: OneLinkListNode<T> = OneLinkListNode(root!.data)
        tempRoot.link = root
        swapNodes(previousNodeFrom: tempRoot, previousNodeTo: previousNode)
    }
    
    func swapNodes(previousNodeFrom: OneLinkListNode<T>?, previousNodeTo: OneLinkListNode<T>?) {
        var tempFromLink: OneLinkListNode<T>?
        var tempToLink: OneLinkListNode<T>?

        tempFromLink = previousNodeFrom?.link
        tempToLink = previousNodeTo?.link
        
        if tempToLink === tail {
            tail = tempFromLink
        } else if tempFromLink === tail {
            tail = tempToLink
        }
        
        previousNodeTo?.link = tempFromLink
        previousNodeFrom?.link = tempToLink
        tempToLink = previousNodeTo?.link?.link
        tempFromLink = previousNodeFrom?.link?.link
        previousNodeTo?.link?.link = tempFromLink
        previousNodeFrom?.link?.link = tempToLink
        
        if previousNodeTo?.link === root {
            root = previousNodeFrom?.link
        }
    }
}

extension ListImpl {
    
    private func searchMinNodeFrom(previousNode: OneLinkListNode<T>) -> OneLinkListNode<T> {
        guard let currentNode = previousNode.link else {
            fatalError()
        }
        
        var minVal = currentNode.data
        var previousMinNode = previousNode
        var previousFromNode = previousNode
        iterateThroughList(from: currentNode, with: { (node) -> Bool in
            if node.data < minVal {
                previousMinNode = previousFromNode
                minVal = node.data
            }
            previousFromNode = node
            return false
        })
        return previousMinNode
    }

    func sortInPlace() {
        guard let root = root else {
            return
        }
        
        let tempRoot: OneLinkListNode<T> = OneLinkListNode(root.data)
        tempRoot.link = root
        
        var currentPreviousNode = tempRoot
        while currentPreviousNode.link !== tail {
            
            let previousMinNode = searchMinNodeFrom(previousNode: currentPreviousNode)
            
            if previousMinNode !== currentPreviousNode {
                swapNodes(previousNodeFrom: currentPreviousNode, previousNodeTo: previousMinNode)
            }
            
            if let nextNode = currentPreviousNode.link {
                currentPreviousNode = nextNode
            }
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
