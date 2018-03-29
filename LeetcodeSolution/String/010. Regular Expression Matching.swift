/*
 10. Regular Expression Matching
 
 Implement regular expression matching with support for '.' and '*'.
 
 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 
 The matching should cover the entire input string (not partial).
 
 The function prototype should be:
 bool isMatch(const char *s, const char *p)
 
 Some examples:
 isMatch("aa","a") → false
 isMatch("aa","aa") → true
 isMatch("aaa","aa") → false
 isMatch("aa", "a*") → true
 isMatch("aa", ".*") → true
 isMatch("ab", ".*") → true
 isMatch("aab", "c*a*b") → true
 */

import Foundation

struct Solution10: TestProtocol {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        var matchString = s
        var regularExpression = p
        
        if regularExpression.count > 0 {
            var lastOfRegularExpression = String(regularExpression.removeLast())
            if lastOfRegularExpression == "*" {
                lastOfRegularExpression = String(regularExpression.removeLast())
                while matchString.count > 0 {
                    let lastOfMatchString = String(matchString.last!)
                    
                    if lastOfRegularExpression == lastOfMatchString || lastOfRegularExpression == "." {
                        if isMatch(matchString, regularExpression) == true {
                            return true
                        } else {
                            _ = matchString.removeLast()
                            return isMatch(matchString, "\(regularExpression)\(lastOfRegularExpression)*")
                        }
                    } else {
                        return isMatch(matchString, regularExpression)
                    }
                }
                return isMatch(matchString, regularExpression)
            } else {
                if matchString.count > 0 {
                    let lastOfMatchString = String(matchString.removeLast())
                    if lastOfRegularExpression == lastOfMatchString || lastOfRegularExpression == "." {
                        return isMatch(matchString, regularExpression)
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        } else if matchString.count > 0 {
            return false
        } else {
            return true
        }
    }
    
    func run() {
        _ = isMatch("aa", "a*")
    }
}
