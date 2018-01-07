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

/* 2.1 Remove duplicates from unsorted linked list
 * Complexity: O(n).
 */
extension ListsTasks {
    func removeDuplicates(in list: ListImpl<Int>) -> ListImpl<Int> {
        guard let root = list.root else {
            return list
        }
        
        var listSet: Set<Int> = [root.data]
        var currentNode: OneLinkListNode<Int> = root
        while currentNode.link != nil {
            if let childNode = currentNode.link {
                if listSet.contains(childNode.data) {
                    let _ = list.removeNode(previousNode: currentNode)
                } else {
                    currentNode = childNode
                }
                listSet.insert(childNode.data)
            } else {
                fatalError()
            }
        }
        return list
    }
    
    func removeDuplicatesWithoutBuffer(in list: OneLinkListNode<Int>) -> OneLinkListNode<Int> {
        var listSet: Set<Int> = [list.data]
        var currentNode: OneLinkListNode<Int> = list
        while currentNode.link != nil {
            if let childNode = currentNode.link {
                if listSet.contains(childNode.data) {
                    let _ = OneLinkList.deleteNode(node: childNode, in: list)
                } else {
                    currentNode = childNode
                }
                listSet.insert(childNode.data)
            } else {
                fatalError()
            }
        }
        return list
    }
    

}
