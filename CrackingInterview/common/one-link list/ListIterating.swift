//
//  ListIterating.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 15/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

protocol ListIteratable {
    associatedtype T: Comparable
    
    func iterateThroughListOfPrevious(with closure: (_ node: OneLinkListNode<T>, _ previousNode: OneLinkListNode<T>) -> Bool)
    
    func iterateThroughList(from node: OneLinkListNode<T>,
                            with closure: (OneLinkListNode<T>) -> Bool)
    
    func iterateThroughListOfPrevious(from previousNode: OneLinkListNode<T>,
                                      with closure: (_ node: OneLinkListNode<T>, _ previousNode: OneLinkListNode<T>) -> Bool)
}

extension ListImpl: ListIteratable {
    
    func iterateThroughListOfPrevious(with closure: (_ node: OneLinkListNode<T>, _ previousNode: OneLinkListNode<T>) -> Bool) {
        guard let root = root else {
            return
        }
        
        let tempRoot: OneLinkListNode<T> = OneLinkListNode(root.data)
        tempRoot.link = root
        
        var currentNode: OneLinkListNode<T>? = root
        var currentPreviousNode: OneLinkListNode<T>? = tempRoot
        
        while currentNode != nil {
            if let currentNode = currentNode,
                let currentPreviousNode = currentPreviousNode,
                closure(currentNode, currentPreviousNode) {
                return
            }
            
            currentPreviousNode = currentNode
            currentNode = currentNode?.link
        }
    }
    
    func iterateThroughList(from node: OneLinkListNode<T>,
                            with closure: (OneLinkListNode<T>) -> Bool) {
        var currentNode: OneLinkListNode<T>? = node
        
        while currentNode != nil {
            if let currentNode = currentNode, closure(currentNode) {
                return
            }
            
            currentNode = currentNode?.link
        }
    }
    
    func iterateThroughListOfPrevious(from previousNode: OneLinkListNode<T>,
                                      with closure: (_ node: OneLinkListNode<T>, _ previousNode: OneLinkListNode<T>) -> Bool) {
        
        var currentNode: OneLinkListNode<T>? = previousNode.link
        var currentPreviousNode: OneLinkListNode<T>? = previousNode
        
        while currentNode != nil {
            if let currentNode = currentNode,
                let currentPreviousNode = currentPreviousNode,
                closure(currentNode, currentPreviousNode) {
                return
            } else {
                fatalError()
            }
            
            currentPreviousNode = currentNode
            currentNode = currentNode?.link
        }
    }

}
