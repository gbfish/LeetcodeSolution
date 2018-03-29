/*
 1. Two Sum
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

import Foundation

struct Solution1: TestProtocol {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numberDictionary = [Int: Int]()
        for index in 0..<nums.count {
            if let numberInDictionary = numberDictionary[nums[index]] {
                if nums[index] + nums[index] == target {
                    return [numberInDictionary, index]
                }
            }
            numberDictionary[nums[index]] = index
        }
        
        for index in 0..<nums.count {
            let number = nums[index]
            let targetNumber = target - number
            if number == targetNumber {
                continue
            }
            if let indexForTarget = numberDictionary[targetNumber] {
                return [index, indexForTarget]
            }
        }
        return [0]
    }
    
    func run() {
        let nums = [2, 7, 11, 15]
        let target = 9
        _ = twoSum(nums, target)
    }
}
