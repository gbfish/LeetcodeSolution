/*
 5. Longest Palindromic Substring
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example:
 
 Input: "babad"
 
 Output: "bab"
 
 Note: "aba" is also a valid answer.
 
 
 Example:
 
 Input: "cbbd"
 
 Output: "bb"
 */

import Foundation

struct Solution5: TestProtocol {

    func longestPalindrome_ma(s: String) -> String {
        var charactersArr = Array<Character>()
        var resultString = String()
        var maxPoint = 0
        
        charactersArr.append("$")
        for character in s {
            charactersArr.append("#")
            charactersArr.append(character)
        }
        charactersArr.append("#")
        charactersArr.append("%")
        
        var rightMax = 0, middlePoint = 0
        var lenArr = Array.init(repeating: 1, count: charactersArr.count)
        
        for i in 1 ..< 2 * s.count + 2 {
            if rightMax > i {
                lenArr[i] = min(rightMax - i, lenArr[2 * middlePoint - i])
            }
            
            while charactersArr[i - lenArr[i]] == charactersArr[i + lenArr[i]] {
                lenArr[i] += 1
            }
            
            if lenArr[i] + i > rightMax {
                middlePoint = i
                
                rightMax = lenArr[i] + i
            }
            
            if lenArr[i] > lenArr[maxPoint] {
                maxPoint = i
            }
        }
        
        for i in stride(from: maxPoint - (lenArr[maxPoint] - 2), to: maxPoint + (lenArr[maxPoint] - 1), by: 2) {
            resultString.append(charactersArr[i])
        }
        
        return resultString
    }
    
    func longestPalindrome1(_ s: String) -> String {
        func string(at index: Int) -> String {
            let begin = s.index(s.startIndex, offsetBy: index)
            let end = s.index(begin, offsetBy: 0)
            return String(s[begin...end])
        }
        
        func string(between left: Int, and right: Int) -> String {
            if left > right {
                return ""
            }
            let begin = s.index(s.startIndex, offsetBy: left)
            let end = s.index(begin, offsetBy: right - left)
            return String(s[begin...end])
        }
        
        func longestPalindrome(at index: Float) -> String {
            if index == Float(Int(index)) {
                var left = Int(index)
                var right = Int(index)
                while left - 1 >= 0 && right + 1 < s.count {
                    if string(at: left - 1) == string(at: right + 1) {
                        left -= 1
                        right += 1
                    } else {
                        break
                    }
                }
                return string(between: left, and: right)
            } else {
                var left = Int(index - 0.5)
                var right = Int(index + 0.5)
                
                if string(at: left) == string(at: right) {
                    while left - 1 >= 0 && right + 1 < s.count {
                        if string(at: left - 1) == string(at: right + 1) {
                            left -= 1
                            right += 1
                        } else {
                            break
                        }
                    }
                    return string(between: left, and: right)
                } else {
                    return ""
                }
            }
        }
        
        
        var longestPalindromeString = ""
        
        for index in stride(from: Float(0), through: Float(s.count - 1), by: Float(0.5)) {
            let palindromeString = longestPalindrome(at: index)
            if palindromeString.count > longestPalindromeString.count {
                longestPalindromeString = palindromeString
            }
        }
        return longestPalindromeString
    }
    
    func longestPalindrome2(_ s: String) -> String {
        var dictionaryIsPalindrome = [String: Bool]()
        func isPalindrome(_ string: String) -> Bool {
            if let bool = dictionaryIsPalindrome[string] {
                return bool
            } else {
                var theString = string
                while theString.count > 1 {
                    let first = theString.removeFirst()
                    let last = theString.removeLast()
                    if first != last {
                        dictionaryIsPalindrome[string] = false
                        return false
                    }
                }
                dictionaryIsPalindrome[string] = true
                return true
            }
        }
        
        var dictionaryLongestPalindrome = [String: String]()
        func longestPalindromeBetween(leading: Int, trailing: Int) -> String {
            let key = "\(leading)-\(trailing)"
            
            if let theLongest = dictionaryLongestPalindrome[key] {
                return theLongest
            } else {
                if leading == trailing {
                    return ""
                } else {
                    let startIndex = s.index(s.startIndex, offsetBy: leading)
                    let endIndex = s.index(startIndex, offsetBy: trailing - leading)
                    let string = String(s[startIndex...endIndex])
                    
                    if isPalindrome(string) {
                        dictionaryLongestPalindrome[key] = string
                        return string
                    } else {
                        let left = longestPalindromeBetween(leading: leading + 1, trailing: trailing)
                        let right = longestPalindromeBetween(leading: leading, trailing: trailing - 1)
                        let theLongest = left.count >= right.count ? left : right
                        dictionaryLongestPalindrome[key] = theLongest
                        return theLongest
                    }
                }
            }
        }
        
        let answer = longestPalindromeBetween(leading: 0, trailing: s.count - 1)
        if answer == "" {
            return String(s.first!)
        } else {
            return answer
        }
    }
    
    func run() {
        _ = longestPalindrome2("babad")
    }
}
