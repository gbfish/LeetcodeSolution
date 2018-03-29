/*
 13. Roman to Integer
 
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */

import Foundation

struct Solution13: TestProtocol {
    
    func romanToInt(_ s: String) -> Int {
        let dictionary = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var roman = s
        var number = 0
        
        while roman.count > 0 {
            let first = String(roman.removeFirst())
            if let firstNumber = dictionary[first] {
                if let second = roman.first {
                    if let secondNumber = dictionary[String(second)] {
                        if firstNumber < secondNumber {
                            number -= firstNumber
                        } else {
                            number += firstNumber
                        }
                    }
                } else {
                    number += firstNumber
                }
            }
        }
        return number
    }
    
    func run() {
        _ = romanToInt("X")
    }
}
