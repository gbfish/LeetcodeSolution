/*
 8. String to Integer (atoi)
 
 Implement atoi to convert a string to an integer.
 
 Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 
 Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.
 
 spoilers alert... click to show requirements for atoi.
 
 Requirements for atoi:
 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is per- formed.
 If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.
 */

import Foundation

struct Solution8: TestProtocol {
    
    func myAtoi(_ str: String) -> Int {
        if str == "" {
            return 0
        }
        
        var stringWithoutSpacing = str
        while stringWithoutSpacing.count > 0 {
            if String(stringWithoutSpacing.first!) == " " {
                stringWithoutSpacing.removeFirst()
            } else {
                break
            }
        }
        
        var isNegative = false
        if let firstCaracter = stringWithoutSpacing.first {
            let firstCaracterString = String(firstCaracter)
            if firstCaracterString == "+" {
                _ = stringWithoutSpacing.removeFirst()
            } else if firstCaracterString == "-" {
                _ = stringWithoutSpacing.removeFirst()
                isNegative = true
            }
        }
        
        var numberArray = [Int]()
        while stringWithoutSpacing.count > 0 {
            if let firstNumber = Int(String(stringWithoutSpacing.removeFirst())) {
                numberArray.append(firstNumber)
            } else {
                break
            }
        }
        
        if numberArray.count > 10 {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        }
        
        var sumNumber: UInt64 = 0
        for number in numberArray {
            sumNumber = sumNumber * 10 + UInt64(number)
        }
        
        if sumNumber > Int32.max {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        }
        
        return isNegative ? -Int(sumNumber) : Int(sumNumber)
    }
    
    func run() {
        _ = myAtoi("123456789")
    }
}
