//
//  Caches.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 01/04/2018.
//  Copyright © 2018 MadMag. All rights reserved.
//

import Foundation

protocol Cache {
    associatedtype T
    associatedtype K
    
    func put(_ value: T, with key: K)
    func getItem(with key: K) -> T?
}

class LruCache<KeyType: Comparable, ElementType>: Cache {
    typealias T = ElementType
    typealias K = KeyType
    
    private var maxTime = 0
    private var cache: [(Int, K?, T?)] = []
    
    private func put(at index: Int, key: K, value: T) {
        maxTime += 1
        cache[index] = (maxTime, key, value)
    }
    
    init(cacheDepth: Int) {
        cache = Array(repeating: (0, nil, nil), count: cacheDepth)
    }
    
    // O(n)
    func put(_ value: T, with key: K) {
        var minTime = cache[0].0
        var minTimeIndex = 0
        for (index, (time, itemKey, _)) in cache.enumerated() {
            if let itemKey = itemKey, itemKey == key {
                put(at: index, key: key, value: value)
                return
            }
            
            if time < minTime {
                minTime = time
                minTimeIndex = index
            }
        }
        
        put(at: minTimeIndex, key: key, value: value)
    }
    
    // O(n)
    func getItem(with key: K) -> T? {
        for (_, itemKey, itemValue) in cache {
            if let itemKey = itemKey, itemKey == key {
                return itemValue
            }
        }
        return nil
    }
}
