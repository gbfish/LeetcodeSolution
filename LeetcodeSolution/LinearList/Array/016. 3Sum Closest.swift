/*
 16. 3Sum Closest
 
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

import Foundation

struct Solution16: TestProtocol {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var result: Int?
        let sortedArray = nums.sorted(by: { $0 < $1 })
        var firstIndex = 0
        while firstIndex < sortedArray.count - 2 {
            var secondIndex = firstIndex + 1
            var thirdIndex = sortedArray.count - 1
            while secondIndex < thirdIndex {
                let sum = sortedArray[firstIndex] + sortedArray[secondIndex] + sortedArray[thirdIndex]
                if let theResult = result {
                    if abs(target - sum) < abs(target - theResult) {
                        result = sum
                    }
                } else {
                    result = sum
                }
                
                if sum > target {
                    thirdIndex -= 1
                } else if sum < target {
                    secondIndex += 1
                } else {
                    return target
                }
            }
            firstIndex += 1
        }
        return result ?? Int.max
    }
    
    func run() {
        let nums = [-1, 2, 1, -4]
        _ = threeSumClosest(nums, 1)
    }
}
