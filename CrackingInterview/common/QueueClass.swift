//
//  QueueClass.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 21/01/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

protocol Queue: class {
    associatedtype T: Comparable
    func push(_ value: T)
    func pop() -> T
    func peek() -> T
    func isEmpty() -> Bool
}

class QueueImpl<T: Comparable> : Queue {
    private let list: ListImpl<T>
    init() {
        list = ListImpl<T>()
    }
    
    func push(_ value: T) {
        list.addNodeAfterTail(OneLinkListNode(value))
    }
    
    func pop() ->T {
        guard let root = list.root else {
            fatalError()
        }
        list.removeNode(at: 0)
        return root.data
    }
    
    func peek() -> T {
        guard let root = list.root else {
            fatalError()
        }
        return root.data
    }
    
    func isEmpty() -> Bool {
        return list.root == nil
    }
}
