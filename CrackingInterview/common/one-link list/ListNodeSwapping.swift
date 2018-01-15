//
//  ListNodeSwapping.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 15/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

protocol NodeSwappable {
    // complexity O(n)
    func swapNode(from indexFrom: Int, to indexTo: Int)
}

extension ListImpl: NodeSwappable {
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
