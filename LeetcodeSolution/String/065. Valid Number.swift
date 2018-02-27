/*
 65. Valid Number
 
 Validate if a given string is numeric.
 
 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one.
 */

import Foundation

struct Solution65 {
    
    func isNumber(_ s: String) -> Bool {
        
        func cleanUpNumberSpace(string: String) -> String {
            var returnValue = string
            while returnValue.count > 0, String(returnValue.first!) == " " {
                _ = returnValue.removeFirst()
            }
            while returnValue.count > 0, String(returnValue.last!) == " " {
                _ = returnValue.removeLast()
            }
            return returnValue
        }
        
        func cleanUpNumberPositiveAndNegative(string: String) -> String {
            var returnValue = string
            if let first = returnValue.first, String(first) == "-" || String(first) == "+" {
                _ = returnValue.removeFirst()
            }
            return returnValue
        }
        
        enum NumberType {
            case int
            case float
            case scientificNotation
        }
        
        func numberTypeAbout(string: String) -> NumberType {
            if string.range(of: "e") != nil {
                return NumberType.scientificNotation
            } else if string.range(of: ".") != nil {
                return NumberType.float
            } else {
                return NumberType.int
            }
        }
        
        func stringIsInt(string: String) -> Bool {
            let numberSet: Set<String> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            for character in string {
                if !numberSet.contains(String(character)) {
                    return false
                }
            }
            return true
        }
        
        func stringIsFloat(string: String) -> Bool {
            if let range = string.range(of: ".") {
                var theString = string
                _ = theString.remove(at: range.lowerBound)
                return theString.count > 0 && stringIsInt(string: theString)
            } else {
                return false
            }
        }
        
        var numberString = cleanUpNumberSpace(string: s)
        numberString = cleanUpNumberPositiveAndNegative(string: numberString)
        
        if numberString.count == 0 {
            return false
        }
        
        let type = numberTypeAbout(string: numberString)
        
        switch type {
        case .int:
            return stringIsInt(string: numberString)
            
        case .float:
            return stringIsFloat(string: numberString)
            
        case .scientificNotation:
            let range = numberString.range(of: "e")!
            let distanceLowerBound = numberString.distance(from: numberString.startIndex, to: range.lowerBound)
            let distanceUpperBound = numberString.distance(from: numberString.startIndex, to: range.upperBound)

            let firstEnd = numberString.index(numberString.startIndex, offsetBy: distanceLowerBound)
            let first = String(numberString[numberString.startIndex..<firstEnd])
            
            if first.count == 0 || (!stringIsInt(string: first) && !stringIsFloat(string: first)) {
                return false
            }
            
            let secondStart = numberString.index(numberString.startIndex, offsetBy: distanceUpperBound)
            var second = String(numberString[secondStart..<numberString.endIndex])
            second = cleanUpNumberPositiveAndNegative(string: second)
            
            if second.count == 0 || !stringIsInt(string: second) {
                return false
            }
        }
        
        return true
    }
    
    func run() {
        _ = isNumber("0")
    }
}
