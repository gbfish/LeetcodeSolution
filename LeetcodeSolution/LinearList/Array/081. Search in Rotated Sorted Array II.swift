/*
 81. Search in Rotated Sorted Array II
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Write a function to determine if a given target is in the array.
 
 The array may contain duplicates.
 */

import Foundation

struct Solution81: TestProtocol {
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var firstIndex: Int = 0
        var lastIndex: Int = nums.count - 1
        
        while firstIndex <= lastIndex {
            if nums[firstIndex] == target {
                return true
            } else if nums[lastIndex] == target {
                return true
            }
            
            if nums[firstIndex] < target {
                firstIndex += 1
            } else if nums[lastIndex] > target {
                lastIndex -= 1
            } else {
                return false
            }
        }
        return false
    }
    
    func run() {
        let nums = [3,1]
        _ = search(nums, 2)
    }
}
