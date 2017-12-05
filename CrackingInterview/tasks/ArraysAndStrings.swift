//
//  ArraysAndStrings.swift
//  CrackingInterview
//
//  Created by Artem Goncharov on 01/12/2017.
//  Copyright © 2017 MadMag. All rights reserved.
//

import Foundation

// Chapter 1
class ArraysAndStringsTasks {
    func symbolCountsDictionary(from string: String) -> [Character: Int] {
        var counts: [Character: Int] = [:]
        for symbol in string {
            if let existingNumber = counts[symbol] {
                counts[symbol] = existingNumber + 1
            } else {
                counts[symbol] = 1
            }
        }
        return counts
    }
}

/* 1.6 Simplest strings compression
 * Complexity: O(n). Appending to string in Swift - O(1) in average
 */
extension ArraysAndStringsTasks {
    func compress(string: String) -> String {
        guard let firstSymbol = string.first else {
            return string
        }
        var compressedString: String = ""
        var previousSymbol: Character = firstSymbol
        var currentCount: Int = 0
        for symbol in string {
            if previousSymbol != symbol {
                compressedString.append(makeCompressedToken(symbol: previousSymbol,
                                                            count: currentCount))
                currentCount = 1
                previousSymbol = symbol
            } else {
                currentCount += 1
            }
        }
        compressedString.append(makeCompressedToken(symbol: previousSymbol,
                                                    count: currentCount))
        return compressedString.count < string.count ? compressedString : string
    }
    
    func makeCompressedToken(symbol: Character,
                             count: Int) -> String {
        return "\(symbol)\(count)"
    }
}

/* 1.7 Rotate matrix with 90 degree clockwise
 * Complexity: O(n*m)
 */
extension ArraysAndStringsTasks {
    func rotateMatrix90Clockwise(_ array: [[Int]]) -> [[Int]] {
        guard let firstRow = array.first else {
            return array
        }
        
        var resArray: [[Int]] = array
        
        // If matrix is non square make rotated sample for filling
        if array.count != firstRow.count {
            resArray = zeroMatrixWithDimensions(rows: firstRow.count, columns: array.count)
        }
        
        for row in (0..<array.count) {
            for column in (0..<array[row].count) {
                resArray[column][array.count - row - 1] = array[row][column]
            }
        }
        return resArray
    }
    
    private func zeroMatrixWithDimensions(rows: Int, columns: Int) -> [[Int]] {
        let zeroRow = Array<Int>.init(repeating: 0, count: columns)
        let resArray: [[Int]] = Array<[Int]>.init(repeating: zeroRow, count: rows)
        return resArray
    }
}

/* 1.8 Fill row and column of matrix with 0 if element is zero
 * Complexity: O(m*n*(m+n))
 */
extension ArraysAndStringsTasks {
    func fillWithNulls(_ array: [[Int]]) -> [[Int]] {
        var resArray: [[Int]] = array
        for row in (0..<array.count) {
            for column in (0..<array[row].count) {
                if array[row][column] == 0 {
                    fillRowWithNulls(&resArray, rowToNull: row, columns: array[row].count)
                    fillColumnWithNulls(&resArray, columnToNull: column)
                }
            }
        }
        return resArray
    }
    
    // Mutating of array to gain performance
    private func fillRowWithNulls(_ array: inout [[Int]], rowToNull: Int, columns: Int) {
        let zeroRow = Array<Int>.init(repeating: 0, count: columns)
        array[rowToNull] = zeroRow
    }
    
    // Mutating of array to gain performance
    private func fillColumnWithNulls(_ array: inout [[Int]], columnToNull: Int) {
        for row in (0..<array.count) {
            array[row][columnToNull] = 0
        }
    }

}

/* 1.9
 * Complexity:
 */
extension ArraysAndStringsTasks {
    func isStringShifted(_ s2: String, shiftedFrom s1: String) -> Bool {
        guard s1.count == s2.count else { return false }
        guard s1 != s2 else { return true }
        
        for index in (1..<s1.count) {
            if isSubstring(String(s1[s1.startIndex...s1.index(s1.startIndex, offsetBy: index)]), of: s2) &&
                isSubstring(String(s1[s1.index(s1.startIndex, offsetBy: index)...s1.endIndex]), of: s2) {
                return true
            }
        }
        return false
    }
    
    private func isSubstring(_ substring: String, of string: String) -> Bool {
        return string.range(of: substring) != nil
    }
}
