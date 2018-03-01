/*
 150. Evaluate Reverse Polish Notation
 
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.
 
 Valid operators are +, -, *, /. Each operand may be an integer or another expression.
 
 Some examples:
 ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
 ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
 */

import Foundation

struct Solution150 {
    
    func evalRPN(_ tokens: [String]) -> Int {
        var arithmeticExpression = tokens
        var stack = [Int]()
        
        func calculate(operatorFunction: ((Int, Int) -> Int)) {
            let second = stack.removeLast()
            let first = stack.removeLast()
            let result = operatorFunction(first, second)
            stack.append(result)
        }
        
        while arithmeticExpression.count > 0 {
            let first = arithmeticExpression.removeFirst()
            switch first {
            case "+":
                calculate(operatorFunction: +)
            case "-":
                calculate(operatorFunction: -)
            case "*":
                calculate(operatorFunction: *)
            case "/":
                calculate(operatorFunction: /)
                
            default:
                stack.append(Int(first)!)
            }
        }
        
        return stack.last!
    }
    
    func run() {
        _ = evalRPN(["2", "1", "+", "3", "*"])
    }
}
