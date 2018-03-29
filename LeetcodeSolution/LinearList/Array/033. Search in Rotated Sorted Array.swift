/*
 33. Search in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 */

import Foundation

struct Solution33: TestProtocol {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var firstIndex: Int = 0
        var lastIndex: Int = nums.count - 1
        
        while firstIndex <= lastIndex {
            if nums[firstIndex] == target {
                return firstIndex
            } else if nums[lastIndex] == target {
                return lastIndex
            }
            
            if nums[firstIndex] < target {
                firstIndex += 1
            } else if nums[lastIndex] > target {
                lastIndex -= 1
            } else {
                return -1
            }
        }
        return -1
    }
    
    func run() {
        let nums = [3,1]
        _ = search(nums, 2)
    }
}
