/*
 70. Climbing Stairs
 
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 
 Example 1:
 
 Input: 2
 Output:  2
 Explanation:  There are two ways to climb to the top.
 
 1. 1 step + 1 step
 2. 2 steps
 Example 2:
 
 Input: 3
 Output:  3
 Explanation:  There are three ways to climb to the top.
 
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

import Foundation

struct Solution70: TestProtocol {
    
    struct FibonacciIterator: IteratorProtocol {
        var previous: Int
        var current: Int
        
        mutating func next() -> Int? {
            let temporary = current
            current = current + previous
            previous = temporary
            return current
        }
    }
    
    func climbStairs(_ n: Int) -> Int {
        var fibonacciIterator = FibonacciIterator(previous: 0, current: 1)
        for _ in 0..<n {
            _ = fibonacciIterator.next()
        }
        return fibonacciIterator.current
    }
    
    func run() {
        _ = climbStairs(3)
    }
}
