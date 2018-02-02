/*
 128. Longest Consecutive Sequence
 
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 For example,
 Given [100, 4, 200, 1, 3, 2],
 The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 
 Your algorithm should run in O(n) complexity.
 */

import Foundation

struct Solution128 {
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numsSet = Set(nums)
        var maxCount: Int = 0
        
        for number in numsSet {
            var newSet: Set = [number]
            
            var numberToBegin = number - 1
            while numsSet.contains(numberToBegin) {
                newSet.insert(numberToBegin)
                numberToBegin -= 1
            }
            var numberToEnd = number + 1
            while numsSet.contains(numberToEnd) {
                newSet.insert(numberToEnd)
                numberToEnd += 1
            }
            
            maxCount = max(maxCount, newSet.count)
            
            for deleteNumber in newSet {
                numsSet.remove(deleteNumber)
            }
        }
        return maxCount
    }
    
    func run() {
        let nums = [100, 4, 200, 1, 3, 2]
        _ = longestConsecutive(nums)
    }
}
