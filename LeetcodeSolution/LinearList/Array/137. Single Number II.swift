/*
 137. Single Number II
 
 Given an array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

import Foundation

struct Solution137 {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var dictionary = [Int: Int]()
        for num in nums {
            dictionary[num] = (dictionary[num] ?? 0) + 1
        }
        for (key, value) in dictionary {
            if value != 3 {
                return key
            }
        }
        return 0
    }
    
    func run() {
        let nums = [1, 3, 1, 3, 5, 3, 1]
        _ = singleNumber(nums)
    }
}
