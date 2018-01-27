/*
 31. Next Permutation
 
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place, do not allocate extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */

import Foundation

struct Solution31 {
    
    func nextPermutation(_ nums: inout [Int]) {
        var index = nums.count - 1
        
        while index >= 0 {
            if index == 0 {
                index -= 1
                break
            }
            if nums[index - 1] >= nums[index]  {
                index -= 1
            } else {
                index -= 1
                break
            }
        }
        
        if index == -1 {
            nums = nums.reversed()
        } else {
            var answerValue = [Int]()
            for tempIndex in 0..<index {
                answerValue.append(nums[tempIndex])
            }
            
            var trailingArray = [Int]()
            for tempIndex in (index + 1)..<nums.count {
                trailingArray.append(nums[tempIndex])
            }
            trailingArray = trailingArray.reversed()
            
            var indexInTrailingArray = 0
            for tempIndex in 0..<trailingArray.count {
                if trailingArray[tempIndex] > nums[index] {
                    indexInTrailingArray = tempIndex
                    break
                }
            }
            
            if trailingArray.count > 0 {
                let headingNumber = trailingArray[indexInTrailingArray]
                trailingArray[indexInTrailingArray] = nums[index]
                trailingArray.insert(headingNumber, at: 0)
                answerValue += trailingArray
            } else {
                answerValue.append(nums[index])
            }
            nums = answerValue
        }
    }
    
    func run() {
        var nums = [1,2,3]
        _ = nextPermutation(&nums)        
    }
}
