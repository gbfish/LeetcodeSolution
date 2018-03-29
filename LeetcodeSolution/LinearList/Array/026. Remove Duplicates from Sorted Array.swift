/*
 26. Remove Duplicates from Sorted Array
 
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 
 */

import Foundation

struct Solution26: TestProtocol {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index: Int = 0
        while index < nums.count - 1 {
            let currentNumber = nums[index]
            let nextNumber = nums[index + 1]
            if currentNumber == nextNumber {
                nums.remove(at: index + 1)
            } else {
                index += 1
            }
        }
        return nums.count
    }
    
    func run() {
        var nums = [1,1,2]
        _ = removeDuplicates(&nums)
    }
}
