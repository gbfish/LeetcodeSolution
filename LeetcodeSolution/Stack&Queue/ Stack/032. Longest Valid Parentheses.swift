/*
 32. Longest Valid Parentheses
 
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 
 For "(()", the longest valid parentheses substring is "()", which has length = 2.
 
 Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
 */

import Foundation

struct Solution32: TestProtocol {
    
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [String]()
        for character in s {
            let characterString = String(character)
            if stack.count == 0 {
                stack.append(characterString)
            } else {
                switch characterString {
                case "(":
                    stack.append(characterString)
                    
                case ")":
                    var temporaryStack = [characterString]
                    var needContinue = true
                    while stack.count > 0 && needContinue {
                        let lastInStack = stack.last!
                        switch lastInStack {
                        case "(":
                            _ = temporaryStack.removeFirst()
                            _ = stack.removeLast()
                            stack.append("2")
                            needContinue = false
                            
                        case ")":
                            needContinue = false
                            
                        default:
                            _ = stack.removeLast()
                            temporaryStack.append(lastInStack)
                        }
                    }
                    while temporaryStack.count > 0 {
                        stack.append(temporaryStack.removeLast())
                    }
                    
                default:
                    break
                }
            }
        }
        
        var sum = 0
        var biggestSum = 0
        for character in stack {
            if let number = Int(String(character)) {
                sum += number
                biggestSum = max(biggestSum, sum)
            } else {
                sum = 0
            }
        }
        return biggestSum
    }
    
    func run() {
        _ = longestValidParentheses(")()())")
    }
}
