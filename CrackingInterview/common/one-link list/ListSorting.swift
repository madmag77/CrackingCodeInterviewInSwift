//
//  ListSorting.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 15/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

protocol InPlaceSortable {
    // Selection sort complexity O(n*n) in all cases
    func sortInPlace_Selection()
    
    // Insertion sort complexity O(n*n) in all cases for one link list
    func sortInPlace_Insertion()
}

// Selection sort
extension ListImpl: InPlaceSortable {
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
    
    func sortInPlace_Selection() {
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

// Insertion sort
extension ListImpl {
    private func searchNodeToInsertAfter(nodePreviousToCompareTo: OneLinkListNode<T>) -> OneLinkListNode<T> {
        guard let currentNode = nodePreviousToCompareTo.link else {
            fatalError()
        }
        
        var previousMinNode = nodePreviousToCompareTo
        iterateThroughListOfPrevious { (node, previousNode) -> Bool in
            if node === currentNode {
                return true
            }
            
            if currentNode.data < node.data {
                previousMinNode = previousNode
                return true
            }
            
            return false
        }
        return previousMinNode
    }
    
    func sortInPlace_Insertion() {
        guard let root = root else {
            return
        }
        
        let tempRoot: OneLinkListNode<T> = OneLinkListNode(root.data)
        tempRoot.link = root
        
        var currentPreviousNode = tempRoot
        while currentPreviousNode.link != nil {
            
            let previousMinNode = searchNodeToInsertAfter(nodePreviousToCompareTo: currentPreviousNode)
            
            if previousMinNode !== currentPreviousNode {
                if let tempNode = currentPreviousNode.link {
                    removeNodeAfter(node: currentPreviousNode)
                    insertNode(tempNode, after: previousMinNode)
                }
            } else {
                if let nextNode = currentPreviousNode.link {
                    currentPreviousNode = nextNode
                }
            }
        }
    }
}

