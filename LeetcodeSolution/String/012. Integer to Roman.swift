/*
 12. Integer to Roman
 
 Given an integer, convert it to a roman numeral.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */

import Foundation

struct Solution12: TestProtocol {
    
    func intToRoman(_ num: Int) -> String {
        func biggestTuple(number: Int) -> (key: Int, value: String)? {
            let dictionary = [1000: "M", 900: "CM", 500: "D", 400: "CD",
                              100: "C", 90: "XC", 50: "L", 40: "XL",
                              10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"].sorted(by: { $0.key < $1.key })
            
            return dictionary.filter({ $0.key <= number }).first
        }
        
        var number = num
        var roman = ""
        while let tuple = biggestTuple(number: number) {
            let count = number / tuple.key
            number %= tuple.key
            for _ in 0...count {
                roman += tuple.value
            }
        }
        return roman
    }
    
    func run() {
        _ = intToRoman(9)
    }
}
