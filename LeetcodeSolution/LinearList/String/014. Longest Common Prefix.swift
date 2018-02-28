/*
 14. Longest Common Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 */

import Foundation

struct Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        func characterString(in string: String, at index: Int) -> String {
            let start = string.index(string.startIndex, offsetBy: index)
            let end = string.index(start, offsetBy: 1)
            return String(string[start..<end])
        }
        
        if strs.count == 0 {
            return ""
        }
        
        var commonPrefix = ""
        var index = 0
        while true {
            var isSame = true
            var character: String?
            
            for string in strs {
                if index < string.count {
                    if let character = character {
                        if characterString(in: string, at: index) != character {
                            isSame = false
                            break
                        }
                    } else {
                        character = characterString(in: string, at: index)
                    }
                } else {
                    index = -1
                    isSame = false
                    break
                }
            }
            
            if isSame {
                commonPrefix += character!
            } else {
                break
            }
            
            if index == -1 {
                break
            } else {
                index += 1
            }
        }
        return commonPrefix
    }
    
    func run() {
        let strs = ["aca", "cba"]
        _ = longestCommonPrefix(strs)
    }
}
