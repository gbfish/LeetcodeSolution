/*
 67. Add Binary
 
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 */

import Foundation

struct Solution67: TestProtocol {
    
    func addBinary(_ a: String, _ b: String) -> String {
        var arrayA = a.map({ Int(String($0))! })
        var arrayB = b.map({ Int(String($0))! })
        var arrayAnwser = [Int]()
        
        while arrayA.count > 0 || arrayB.count > 0 {
            var firstNumber = 0
            if arrayA.count > 0 {
                firstNumber = arrayA.removeLast()
            }
            var secondNumber = 0
            if arrayB.count > 0 {
                secondNumber = arrayB.removeLast()
            }
            
            arrayAnwser.insert(firstNumber + secondNumber, at: 0)
        }
        
        var needAddOne = false
        for index in arrayAnwser.indices.reversed() {
            var number = arrayAnwser[index]
            if needAddOne {
                number += 1
                needAddOne = false
            }
            if number == 3 || number == 2 {
                arrayAnwser[index] = number - 2
                needAddOne = true
            } else {
                arrayAnwser[index] = number
            }
        }
        if needAddOne {
            arrayAnwser.insert(1, at: 0)
        }
        
        return arrayAnwser.reduce("", { "\($0)\($1)" })
    }
    
    func run() {
        _ = addBinary("11", "1")
    }
}
