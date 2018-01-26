/*
 4. Median of Two Sorted Arrays
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */

import Foundation

struct Solution4 {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1
        var nums2 = nums2
        
        func getSmallest() -> Int {
            let firstNumberInNums1 = nums1.first
            let firstNumberInNums2 = nums2.first
            
            if firstNumberInNums1 == nil {
                return nums2.removeFirst()
            } else if firstNumberInNums2 == nil {
                return nums1.removeFirst()
            } else {
                if firstNumberInNums1! < firstNumberInNums2! {
                    return nums1.removeFirst()
                } else {
                    return nums2.removeFirst()
                }
            }
        }
        
        let totalIsEven = (nums1.count + nums2.count) % 2 == 0
        
        var index: Int
        let needNext: Bool
        if totalIsEven == true {
            index = (nums1.count + nums2.count) / 2 - 1
            needNext = true
        } else {
            index = (nums1.count + nums2.count) / 2
            needNext = false
        }
        
        for _ in 0..<index {
            _ = getSmallest()
        }
        
        if needNext == true {
            let firstNumber = getSmallest()
            let secondNumber = getSmallest()
            return (Double(firstNumber) + Double(secondNumber)) / 2
        } else {
            return Double(getSmallest())
        }
    }
    
    func run() {
        let nums1 = [1,2]
        let nums2 = [3,4]
        _ = findMedianSortedArrays(nums1, nums2)
    }
}
