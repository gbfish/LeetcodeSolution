/*
 42. Trapping Rain Water
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 
 For example,
 Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
 
 
 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
 */

import Foundation

struct Solution42 {
    
    func trap(_ height: [Int]) -> Int {
        func trapWater(at index: Int) -> Int {
            var leftMax = 0
            for leftIndex in 0..<index {
                leftMax = max(leftMax, height[leftIndex])
            }
            var rightMax = 0
            for rightIndex in (index + 1)..<height.count {
                rightMax = max(rightMax, height[rightIndex])
            }
            return max(0, min(leftMax, rightMax) - height[index])
        }
        
        var returnValue = 0
        for index in 0..<height.count {
            returnValue += trapWater(at: index)
        }
        
        return returnValue
    }
    
    func run() {
        let height =  [0,1,0,2,1,0,1,3,2,1,2,1]
        _ = trap(height)
    }
}
