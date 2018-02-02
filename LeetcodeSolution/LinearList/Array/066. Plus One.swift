/*
 66. Plus One
 
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 */

import Foundation

struct Solution66 {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitsArray = digits
        
        func plusOne(at index: Int) {
            if index == -1 {
                digitsArray.insert(1, at: 0)
            } else if digitsArray.count == 1 && digitsArray.first! == 0 {
                digitsArray[0] = 1
            } else {
                let result = digitsArray[index] + 1
                if result == 10 {
                    digitsArray[index] = 0
                    plusOne(at: index - 1)
                } else {
                    digitsArray[index] = result
                }
            }
        }
        
        plusOne(at: digits.count - 1)
        
        return digitsArray
    }
    
    func run() {
        let digits = [1]
        _ = plusOne(digits)
    }
}
