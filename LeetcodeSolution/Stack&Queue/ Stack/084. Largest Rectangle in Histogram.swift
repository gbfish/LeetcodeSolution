/*
 84. Largest Rectangle in Histogram
 
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 For example,
 Given heights = [2,1,5,6,2,3],
 return 10.
 */

import Foundation

struct Solution84 {
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var indexStack = [Int]()
        var largest = 0
        
        func calculate(index: Int) {
            while indexStack.count > 0 {
                let last = indexStack.removeLast()
                let from = indexStack.count > 0 ? indexStack.last! + 1 : 0
                
                let rectangleArea = (index - from) * heights[last]
                largest = max(largest, rectangleArea)
                
                if heights[index] >= heights[last] {
                    indexStack.append(last)
                    break
                }
            }
            indexStack.append(index)
        }
        
        for index in heights.indices {
            if let indexStackTop = indexStack.last {
                if heights[index] >= heights[indexStackTop] {
                    indexStack.append(index)
                } else {
                    calculate(index: index)
                }
            } else {
                indexStack.append(index)
            }
        }
        
        while indexStack.count > 0 {
            let last = indexStack.removeLast()
            let from = indexStack.count > 0 ? indexStack.last! + 1 : 0
            
            let rectangleArea = (heights.count - from) * heights[last]
            largest = max(largest, rectangleArea)
        }
        return largest
    }
    
    func run() {
        _ = largestRectangleArea([2,1,5,6,2,3])
    }
    
}
