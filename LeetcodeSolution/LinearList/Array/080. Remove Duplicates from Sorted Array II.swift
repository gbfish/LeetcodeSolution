/*
 80. Remove Duplicates from Sorted Array II
 
 Follow up for "Remove Duplicates":
 What if duplicates are allowed at most twice?
 
 For example,
 Given sorted array nums = [1,1,1,2,2,3],
 
 Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.
 */

import Foundation

struct Solution80: TestProtocol {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index: Int = 0
        while index < nums.count - 2 {
            let currentNumber = nums[index]
            let nextNumber = nums[index + 2]
            if currentNumber == nextNumber {
                nums.remove(at: index + 2)
            } else {
                index += 1
            }
        }
        return nums.count
    }
    
    func run() {
        var nums = [1,1,1,2,2,3]
        _ = removeDuplicates(&nums)
    }
}
