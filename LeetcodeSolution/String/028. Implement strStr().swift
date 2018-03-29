/*
 28. Implement strStr()
 
 Implement strStr().
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Example 1:
 
 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:
 
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 */

import Foundation

struct Solution28: TestProtocol {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if let range = haystack.range(of: needle, options: .literal)?.lowerBound {
            return Int(haystack.distance(from: haystack.startIndex, to: range))
        } else if needle == "" {
            return 0
        } else {
            return -1
        }
    }
    
    func run() {
        _ = strStr("hello", "ll")
    }
}
