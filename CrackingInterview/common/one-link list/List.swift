//
//  Lists.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 23/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

class OneLinkListNode<T> {
    var data: T
    var link: OneLinkListNode<T>? = nil
    
    init(_ data: T) {
        self.data = data
    }
}

/* Implementation of one link list with just pointer to root node */

protocol Iterator {
    associatedtype T
    mutating func next() -> OneLinkListNode<T>?
}

struct OneLinkListIterator<T>: Iterator {
    typealias Element = OneLinkListNode<T>
    
    let rootNode: OneLinkListNode<T>
    var currentNode: OneLinkListNode<T>?
    
    init(rootNode: OneLinkListNode<T>) {
        self.rootNode = rootNode
        self.currentNode = rootNode
    }
    
    mutating func next() -> OneLinkListNode<T>? {
        currentNode = currentNode?.link
        return currentNode
    }
}

// It's not that convinient to use this helper functions with just pointer to root node
class OneLinkList {
    // We pass current node into the closure and wait for stop signal
    static func iterateThroughList<T>(_ listWithRoot: OneLinkListNode<T>, with closure: (OneLinkListNode<T>) -> Bool) {
        var currentNode = listWithRoot
        
        if closure(currentNode) {
            return
        }

        while currentNode.link != nil {
            guard let childNode = currentNode.link else {
                fatalError()
            }
            
            if closure(childNode) {
                return
            }
            
            currentNode = childNode
        }
    }
    
    static func addNode<T>(_ node: OneLinkListNode<T>, to listWithRoot: OneLinkListNode<T>) {
        var lastNode: OneLinkListNode<T> = listWithRoot
        iterateThroughList(listWithRoot) { (currentNode) -> Bool in
            lastNode = currentNode
            return false
        }
        lastNode.link = node
    }
    
    static func insertNode<T>(_ node: OneLinkListNode<T>, afterNode: OneLinkListNode<T>) {
        let previousLink: OneLinkListNode<T>? = afterNode.link
        afterNode.link = node
        node.link = previousLink
    }
    
    static func getNode<T>(index: Int, in listWithRoot: OneLinkListNode<T>) -> OneLinkListNode<T>? {
        if index == 0 {
            return listWithRoot
        }
        
        var counter: Int = 0
        var nodeAtIndex: OneLinkListNode<T>? = nil
        iterateThroughList(listWithRoot) { (currentNode) -> Bool in
            if counter == index {
                nodeAtIndex = currentNode
                return true
            }
            counter += 1
            return false
        }
        
        return nodeAtIndex
    }
    
    static func nodeCount<T>(of listWithRoot: OneLinkListNode<T>) -> Int {
        var counter: Int = 0
        iterateThroughList(listWithRoot) { (currentNode) -> Bool in
            counter += 1
            return false
        }
        return counter
    }
    
    static func getIterator<T>(of listWithRoot: OneLinkListNode<T>) -> OneLinkListIterator<T> {
        return OneLinkListIterator(rootNode: listWithRoot)
    }
    
    static func deleteNode<T>(node:  OneLinkListNode<T>, in listWithRoot: OneLinkListNode<T>) -> Bool {
        guard node !== listWithRoot else {
            return false
        }
        
        var deleted = false
        var previousNode: OneLinkListNode<T> = listWithRoot
        iterateThroughList(listWithRoot) { (currentNode) -> Bool in
            if node === currentNode {
                previousNode.link = currentNode.link
                deleted = true
                return true
            }
            previousNode = currentNode
            return false
        }
        return deleted
    }
    
    // Implementation absolutely dumb because need a lot of time by nature of appends
    static func makeList<T>(from array: Array<T>) ->  OneLinkListNode<T>? {
        var rootNode: OneLinkListNode<T>? = nil
        var currentNode: OneLinkListNode<T>? = nil
        for val in array {
            if rootNode == nil {
                rootNode = OneLinkListNode(val)
                currentNode = rootNode
            } else {
                let tempNode = OneLinkListNode(val)
                currentNode?.link = tempNode
                currentNode = tempNode
            }
        }
        return rootNode
    }    
}
