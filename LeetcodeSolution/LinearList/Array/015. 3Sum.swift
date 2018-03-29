/*
 15. 3Sum
 
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */

import Foundation

struct Solution15: TestProtocol {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var returnValue = [[Int]]()
        var returnSet = Set<String>()
        
        if nums.count < 3 {
            return returnValue
        }
        
        let sortedArray = nums.sorted(by: { $0 < $1 })
        var firstIndex = 0
        
        while firstIndex < sortedArray.count - 2 {
            let firstNumber = sortedArray[firstIndex]
            
            var beginIndex = firstIndex + 1
            var endIndex = sortedArray.count - 1
            
            while beginIndex < endIndex {
                let beginNumber = sortedArray[beginIndex]
                let endNumber = sortedArray[endIndex]
                
                if firstNumber + beginNumber + endNumber > 0 {
                    endIndex -= 1
                } else if firstNumber + beginNumber + endNumber < 0  {
                    beginIndex += 1
                } else {
                    returnSet.insert("\(firstNumber)|\(beginNumber)|\(endNumber)")
                    
                    beginIndex += 1
                    endIndex -= 1
                }
            }
            
            // move first to next
            var firstNextIndex = firstIndex + 1
            while firstNextIndex < sortedArray.count && sortedArray[firstIndex] == sortedArray[firstNextIndex] {
                firstNextIndex += 1
            }
            firstIndex = firstNextIndex
        }
        
        for string in returnSet {
            returnValue.append(string.split(separator: "|").map({ Int($0)! }))
        }
        return returnValue
    }
    
    func run() {
        let s = [-1, 0, 1, 2, -1, -4]
        _ = threeSum(s)
    }
}
