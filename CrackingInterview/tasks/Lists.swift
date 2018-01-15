//
//  Lists.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 08/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

// Chapter 2
class ListsTasks {
    
}

extension ListsTasks {
    /* 2.1 Remove duplicates from unsorted linked list
     * Complexity: O(n).
     */
    func removeDuplicatesInPlace(in list: ListImpl<Int>) {
        guard let root = list.root else {
            return
        }
        
        var listSet: Set<Int> = [root.data]
        var currentNode: OneLinkListNode<Int> = root
        while currentNode.link != nil {
            if let childNode = currentNode.link {
                if listSet.contains(childNode.data) {
                    let _ = list.removeNodeAfter(node: currentNode)
                } else {
                    currentNode = childNode
                }
                listSet.insert(childNode.data)
            } else {
                fatalError()
            }
        }
    }
    
    /* 2.1 Remove duplicates from unsorted linked list without buffer
     * Complexity: O(n*n).
     */
    func removeDuplicatesInPlaceWithoutBuffer(in list: ListImpl<Int>) {
        guard let root = list.root else {
            return
        }
        
        var currentNode: OneLinkListNode<Int>? = root
        while currentNode?.link != nil {
            var previousInnerCurrentNode: OneLinkListNode<Int>? = currentNode
            while previousInnerCurrentNode?.link != nil {
                if previousInnerCurrentNode?.link?.data == currentNode?.data {
                    list.removeNodeAfter(node: previousInnerCurrentNode!)
                } else {
                    previousInnerCurrentNode = previousInnerCurrentNode?.link
                }
            }
            currentNode = currentNode?.link
        }
    }
}
