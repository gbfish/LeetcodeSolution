/*
 44. Wildcard Matching
 
 Implement wildcard pattern matching with support for '?' and '*'.
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 
 The matching should cover the entire input string (not partial).
 
 The function prototype should be:
 bool isMatch(const char *s, const char *p)
 
 Some examples:
 isMatch("aa","a") → false
 isMatch("aa","aa") → true
 isMatch("aaa","aa") → false
 isMatch("aa", "*") → true
 isMatch("aa", "a*") → true
 isMatch("ab", "?*") → true
 isMatch("aab", "c*a*b") → false
 */

import Foundation

struct Solution44: TestProtocol {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        func character(in string: String, at index: Int) -> String {
            let start = string.index(string.startIndex, offsetBy: index)
            let end = string.index(start, offsetBy: 1)
            return String(string[start..<end])
        }
        
        var sIndex = 0
        var pIndex = 0
        
        var sCharacter: String {
            return character(in: s, at: sIndex)
        }
        var pCharacter: String {
            return character(in: p, at: pIndex)
        }
        
        var sSavedIndex = 0
        var pSavedIndex = -1
        
        while sIndex < s.count {
            if pIndex < p.count && (sCharacter == pCharacter || pCharacter == "?") {
                sIndex += 1
                pIndex += 1
            } else if pIndex < p.count && pCharacter == "*" {
                sSavedIndex = sIndex
                pSavedIndex = pIndex
                pIndex += 1
            } else if pSavedIndex != -1 {
                pIndex = pSavedIndex + 1
                sSavedIndex += 1
                sIndex = sSavedIndex
            } else {
                return false
            }
        }
        while pIndex < p.count && pCharacter == "*" {
            pIndex += 1
        }
        return pIndex == p.count
    }
    
    func run() {
        _ = isMatch("aa", "a")
    }
}
