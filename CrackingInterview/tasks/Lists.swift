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

/* 2.2 Looking for k-th element from the end
 * Complexity: O(n).
 */
extension ListsTasks {
    func searchNodeFromEnd(in list: ListImpl<Int>, indexFromEnd: Int) -> OneLinkListNode<Int>? {
        guard let root = list.root else {
            return nil
        }
        
        var foundNode: OneLinkListNode<Int>? = nil
        var counter: Int = 0
        
        list.iterateThroughList { (node) -> Bool in
            if counter == indexFromEnd {
                foundNode = root
            } else if counter > indexFromEnd {
                foundNode = foundNode?.link
            }
            counter += 1
            return false
        }
        
        return foundNode
    }
}

/* 2.3 Remove node (non root nor tail) from the list
 * Complexity: O(n).
 */
extension ListsTasks {
    func removeNodeFromList(in list: ListImpl<Int>, nodeToRemove: OneLinkListNode<Int>) {
        guard let root = list.root else {
            return
        }
        
        var previousNode: OneLinkListNode<Int> = root
        
        list.iterateThroughList { (node) -> Bool in
            if node === nodeToRemove {
                list.removeNodeAfter(node: previousNode)
                return true
            } else {
                previousNode = node
            }
            return false
        }
    }
}

/* 2.4 Reorder list around definite element x
 * (elements < x should be in left part, elements > x in right part)
 * Complexity: O(n).
 */
extension ListsTasks {
    func reoderList(_ list: ListImpl<Int>, relativeTo splitNode: OneLinkListNode<Int>) {
        guard let root = list.root else {
            return
        }
        
        let tempRoot: OneLinkListNode<Int> = OneLinkListNode(0)
        tempRoot.link = root
        var previousNode: OneLinkListNode<Int> = tempRoot
        
        while previousNode.link != nil,
            let currentNode = previousNode.link {
                
            if currentNode.data >= splitNode.data {
                let tempNode = currentNode
                list.removeNodeAfter(node: previousNode)
                list.addNodeAfterTail(tempNode)
            }
            
            if let newPreviousNode = previousNode.link {
                previousNode = newPreviousNode
            }
        }
    }
}

/* 2.5 Sum two numbers represented by lists
 * e.g. 256 is represented as 6->5->2
 * Complexity: O(n).
 */
extension ListsTasks {
    func sumNumbersAsLists(_ list1: ListImpl<Int>, _ list2: ListImpl<Int>) -> ListImpl<Int> {
        let result = ListImpl<Int>()
        var currentNode1 = list1.root
        var currentNode2 = list2.root
        var digitTransfer = false
        while currentNode1 != nil || currentNode2 != nil {
            let digitsSum = (currentNode1?.data ?? 0) + (currentNode2?.data ?? 0) + (digitTransfer ? 1 : 0)
            digitTransfer = digitsSum > 9
            
            result.addNodeAfterTail(OneLinkListNode(digitsSum % 10))
            
            currentNode1 = currentNode1?.link ?? nil
            currentNode2 = currentNode2?.link ?? nil
        }
        
        if digitTransfer {
            result.addNodeAfterTail(OneLinkListNode(1))
        }
        
        return result
    }
    
    // Same task but numbers are represented in reverse order 256 represented as 2->5->6
    func sumNumbersAsReverseLists(_ list1: ListImpl<Int>, _ list2: ListImpl<Int>) -> ListImpl<Int> {
        let result = ListImpl<Int>()
        // TODO - need implementation
        return result
    }
}
