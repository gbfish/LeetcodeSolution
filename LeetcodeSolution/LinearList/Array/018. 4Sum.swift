/*
 18. 4Sum
 
 Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note: The solution set must not contain duplicate quadruplets.
 
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 */

import Foundation

struct Solution18 {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return [[Int]]()
        }
        
        var dictionary = [Int: [(Int, Int)]]()
        for number1Index in 0..<(nums.count - 1) {
            for number2Index in (number1Index + 1)..<nums.count {
                let sum = nums[number1Index] + nums[number2Index]
                let indices = (number1Index, number2Index)
                
                if var indicesArray = dictionary[sum] {
                    indicesArray.append(indices)
                    dictionary[sum] = indicesArray
                } else {
                    dictionary[sum] = [indices]
                }
            }
        }
        let sortedArray = dictionary.map({ ($0, $1) }).sorted(by: { $0.0 < $1.0 })
        
        var leadingIndex = 0
        var trailingIndex = sortedArray.count - 1
        var answerSet = Set<Set<Int>>()
        
        while leadingIndex <= trailingIndex {
            let leadingTuple = sortedArray[leadingIndex]
            let trailingTuple = sortedArray[trailingIndex]
            
            let sum = leadingTuple.0 + trailingTuple.0
            if sum > target {
                trailingIndex -= 1
            } else if sum < target {
                leadingIndex += 1
            } else {
                for leadingIndices in leadingTuple.1 {
                    for trailingIndices in trailingTuple.1 {
                        let set: Set = [leadingIndices.0, leadingIndices.1, trailingIndices.0, trailingIndices.1]
                        if set.count == 4 {
                            answerSet.insert(set)
                        }
                    }
                }
                trailingIndex -= 1
                leadingIndex += 1
            }
            
        }
        
        var answerArray = [[Int]]()
        answerSet.forEach({
            let array = $0.map({ nums[$0] }).sorted(by: { $0 < $1 })
            
            var isUnique = true
            answerArray.forEach({
                if $0 == array {
                    isUnique = false
                }
            })
            if isUnique {
                answerArray.append(array)
            }
        })
        
        return answerArray
    }
    
    func run() {
        let nums = [1, 0, -1, 0, -2, 2]
        _ = fourSum(nums, 0)
    }
}
