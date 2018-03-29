/*
 20. Valid Parentheses
 
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */

import Foundation

struct Solution20: TestProtocol {
    
    func isValid(_ s: String) -> Bool {
        
        func index(character: Character) -> Int? {
            let dictionaryString = "()[]{}"
            if let range = dictionaryString.range(of: String(character)) {
                return dictionaryString.distance(from: dictionaryString.startIndex, to: range.lowerBound)
            } else {
                return nil
            }
        }
        
        var stack = [Int]()
        for charactar in s {
            if let index = index(character: charactar) {
                if let lastIndex = stack.last {
                    if lastIndex + 1 == index {
                        _ = stack.removeLast()
                    } else {
                        if index % 2 == 0 {
                            stack.append(index)
                        } else {
                            return false
                        }
                    }
                } else {
                    if index % 2 == 0 {
                        stack.append(index)
                    } else {
                        return false
                    }
                }
            }
        }
        return stack.count == 0
    }
    
    func run() {
        _ = isValid("()[]{}")
    }
}
