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
    // Complexity: O(n * n), in best case (without overflows): O(n)
    func sumNumbersAsReverseLists(_ list1: ListImpl<Int>, _ list2: ListImpl<Int>) -> ListImpl<Int> {
        var result = ListImpl<Int>()
        var lastOverflow: OneLinkListNode<Int>? = nil

        (result, lastOverflow) = sumRegardlessOverflows(list1,
                                                        list2,
                                                        list1ExcessList2: differenceLengthBetween(list1, list2))
        
        // iterate throw list with sums while there is no any overflows in it
        while lastOverflow != nil {
             lastOverflow = arrangeOverflows(listWithSums: result, lastOverflow: lastOverflow)
        }
        
        return result
    }
    
    private func differenceLengthBetween(_ list1: ListImpl<Int>, _ list2: ListImpl<Int>) -> Int {
        var currentNode1 = list1.root
        var currentNode2 = list2.root
        var len1ToLen2Difference: Int = 0
        
        // calculate difference between lists lengths
        while currentNode1 != nil || currentNode2 != nil {
            if currentNode1 != nil && currentNode2 == nil {
                len1ToLen2Difference += 1
            } else if currentNode1 == nil && currentNode2 != nil {
                len1ToLen2Difference -= 1
            }
            
            currentNode1 = currentNode1?.link ?? nil
            currentNode2 = currentNode2?.link ?? nil
        }
        
        return len1ToLen2Difference
    }
    
    // sum data in two lists according to right digi ranking regardless of overflows,
    // return list with sums and last node with overflow
    private func sumRegardlessOverflows(_ list1: ListImpl<Int>, _ list2: ListImpl<Int>, list1ExcessList2: Int) -> (result: ListImpl<Int>, lastOverflow: OneLinkListNode<Int>?) {
        
        let result = ListImpl<Int>()
        var currentNode1 = list1.root
        var currentNode2 = list2.root
        var len1ToLen2Difference = list1ExcessList2
        
        var lastOverflow: OneLinkListNode<Int>? = nil
        while currentNode1 != nil || currentNode2 != nil {
            var digitsSum = 0
            if len1ToLen2Difference > 0 {
                len1ToLen2Difference -= 1
                digitsSum = currentNode1?.data ?? 0
                currentNode1 = currentNode1?.link ?? nil
            } else if len1ToLen2Difference < 0 {
                len1ToLen2Difference += 1
                digitsSum = currentNode2?.data ?? 0
                currentNode2 = currentNode2?.link ?? nil
            } else {
                digitsSum = (currentNode1?.data ?? 0) + (currentNode2?.data ?? 0)
                currentNode1 = currentNode1?.link ?? nil
                currentNode2 = currentNode2?.link ?? nil
            }
            
            result.addNodeAfterTail(OneLinkListNode(digitsSum))
            
            if digitsSum > 9 {
                lastOverflow = result.tail
            }
        }
        
        return (result, lastOverflow)
    }

    // transer overflows to previous digit and return last node with overflow
    private func arrangeOverflows(listWithSums: ListImpl<Int>, lastOverflow:  OneLinkListNode<Int>?) -> OneLinkListNode<Int>? {
        var currentNode = listWithSums.root
        var previousCurrentNode: OneLinkListNode<Int>? = nil
        var newOverflow: OneLinkListNode<Int>? = nil
        while currentNode !== lastOverflow?.link {
            if (currentNode?.data ?? 0) > 9 {
                if previousCurrentNode == nil {
                    listWithSums.addNodeBeforeRoot(OneLinkListNode(1))
                } else {
                    previousCurrentNode!.data += 1
                    if previousCurrentNode!.data > 9 {
                        newOverflow = previousCurrentNode
                    }
                }
                currentNode?.data %= 10
            }
            previousCurrentNode = currentNode
            currentNode = currentNode?.link
        }
        
        return newOverflow
    }
}
