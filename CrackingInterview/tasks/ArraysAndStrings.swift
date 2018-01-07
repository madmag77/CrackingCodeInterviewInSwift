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

/* 1.1 Is there symbol duplicates in the string
 * Complexity: O(n).
 */
extension ArraysAndStringsTasks {
    func hasDuplicates(in string: String) -> Bool {
        var symbolsFreqs: [Character: Int] = [:]
        for symbol in string {
            if symbolsFreqs[symbol] != nil {
                return true
            } else {
                symbolsFreqs[symbol] = 1
            }
        }
        return false
    }
}

/* 1.2 Is string rearrangement of another string
 * Complexity: O(n+m).
 */
extension ArraysAndStringsTasks {
    func isRearrangement(string1: String, string2: String) -> Bool {
        return isHashTablesEqual(hashTableFromString(string1) , hashTableFromString(string2))
    }
    
    func hashTableFromString(_ string: String) -> [Character: Int] {
        var stringTable: [Character: Int] = [:]
        for symbol in string {
            if let counter = stringTable[symbol] {
                stringTable[symbol] = counter + 1
            } else {
                stringTable[symbol] = 1
            }
        }
        return stringTable
    }
    
    func isHashTablesEqual(_ hash1: [Character: Int], _ hash2: [Character: Int]) -> Bool {
        if hash1.keys.count != hash2.keys.count {
            return false
        }
        
        for key in hash1.keys {
            if hash1[key] != hash2[key] {
                return false
            }
        }
        return true
    }
}

/* 1.3 Replace spaces in string to %20
 * Complexity: O(n). Appending to string in Swift - O(1) in average
 */
extension ArraysAndStringsTasks {
    func stringWithReplacedSpaces(from string: String) -> String {
        var res: String = ""
        let charToReplace: Character = " "
        for symbol in string {
            if symbol == charToReplace {
                res.append("%20")
            } else {
                res.append(symbol)
            }
        }
        return res
    }
}

/* 1.4 Is string a palindrom
 * Complexity: O(n).
 */
extension ArraysAndStringsTasks {
    func isPalindrom(_ string: String) -> Bool {
        var symbolsNumbers: [Character: Int] = [:]
        for symbol in string {
            // Reset number of symbols if they occures second time
            if symbolsNumbers[symbol] != nil {
                symbolsNumbers[symbol] = nil
            } else {
                symbolsNumbers[symbol] = 1
            }
        }
        
        // String can be a palindrom if only one symbol or no symbol occurs once
        return symbolsNumbers.count <= 1
    }
}

/* 1.5 Is distance between strings is 1
 * Complexity: O(n). Not taking into account conversion string -> array
 */
extension ArraysAndStringsTasks {
    func isOneDistance(from string1: String, to string2: String) -> Bool {
        let minIndex = string1.count > string2.count ? string2.count : string1.count
        let stringArray1 = getArray(from: string1)
        let stringArray2 = getArray(from: string2)
        var changes = 0
        for i in (0..<minIndex) {
            if stringArray1[i] != stringArray2[i]  {
                changes += 1
            }
        }
        changes += abs(string1.count - string2.count)
        return changes == 1
    }
    
    func getArray(from string: String) -> [Character] {
        var res: [Character] = []
        for symbol in string {
            res.append(symbol)
        }
        return res
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
        
        for index in (0..<s1.count) {
            let leftString = String(s1[s1.startIndex...s1.index(s1.startIndex, offsetBy: index)])
            let rightString = String(s1[s1.index(s1.startIndex, offsetBy: index + 1)..<s1.endIndex])
            if isSubstring(leftString, of: s2) &&
                isSubstring(rightString, of: s2) {
                return true
            }
        }
        return false
    }
    
    private func isSubstring(_ substring: String, of string: String) -> Bool {
        return string.range(of: substring) != nil
    }
}