//
//  Lists.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 08/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

// Chapter 3
class StackTasks {
    
}

extension ListsTasks {
    /* 3.5 Stack sorting
     * Complexity: O(n*n).
     */
    func sortStack(_ stack: StackImpl<Int>) {
        guard !stack.isEmpty() else {
            return
        }
        
        let tempStack = StackImpl<Int>()
        var stackDepth = getStackLength(stack, tempStack: tempStack)
        // Idea is to have sorted stack on the bottom and unsorted at the top
        // On every iteration we search for maximum element in unsorted part and put it on the bottom
        while stackDepth != 0 {
            let maxValue = getMaxValWithReload(from: stack, to: tempStack, stackDepthToFind: stackDepth)
            stack.push(maxValue)
            stackDepth -= 1
            reload(from: tempStack, to: stack)
        }
    }
    
    private func getStackLength(_ stack: StackImpl<Int>, tempStack: StackImpl<Int>) -> Int {
        var stackLength = 0
        while !stack.isEmpty() {
            tempStack.push(stack.pop())
            stackLength += 1
        }
        while !tempStack.isEmpty() {
            stack.push(tempStack.pop())
        }
        
        return stackLength
    }
    
    private func getMaxValWithReload(from stack: StackImpl<Int>, to tempStack: StackImpl<Int>, stackDepthToFind: Int) -> Int {
        var maxValue = stack.pop()
        var counter = 1
        while !stack.isEmpty() && counter < stackDepthToFind {
            let currentValue = stack.pop()
            if currentValue > maxValue {
                tempStack.push(maxValue)
                maxValue = currentValue
            } else {
                tempStack.push(currentValue)
            }
            counter += 1
        }
        return maxValue
    }
    
    private func reload(from tempStack: StackImpl<Int>, to stack: StackImpl<Int>) {
        while !tempStack.isEmpty() {
            stack.push(tempStack.pop())
        }
    }
}
