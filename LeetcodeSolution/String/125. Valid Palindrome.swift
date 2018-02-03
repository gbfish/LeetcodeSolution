/*
 125. Valid Palindrome
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 For example,
 "A man, a plan, a canal: Panama" is a palindrome.
 "race a car" is not a palindrome.
 
 Note:
 Have you consider that the string might be empty? This is a good question to ask during an interview.
 
 For the purpose of this problem, we define empty string as valid palindrome.
 */

import Foundation

struct Solution125 {
    
    func isPalindrome(_ s: String) -> Bool {
        func isAlphanumeric(string: String) -> Bool {
            return !string.isEmpty && string.range(of: "[^a-zA-Z0-9]", options: String.CompareOptions.regularExpression) == nil
        }
        
        let filterString = s.filter({ isAlphanumeric(string: String($0)) }).lowercased()
        let reverseFilterString = String(filterString.reversed())
        return filterString == reverseFilterString
    }
    
    func run() {
        _ = isPalindrome("A man, a plan, a canal: Panama")
    }
}
