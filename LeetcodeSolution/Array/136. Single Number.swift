/*
 136. Single Number
 
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

import Foundation

struct Solution136 {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var returnValue = 0
        for num in nums {
            returnValue ^= num
        }
        return returnValue
    }
    
    func run() {
        let nums = [1, 3, 5, 3, 1]
        let answer = singleNumber(nums)
        print("answer = \(answer)")
    }
}
