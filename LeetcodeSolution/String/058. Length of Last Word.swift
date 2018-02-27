/*
 58. Length of Last Word
 
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a character sequence consists of non-space characters only.
 
 Example:
 
 Input: "Hello World"
 Output: 5
 */

import Foundation

struct Solution58 {
    
    func lengthOfLastWord(_ s: String) -> Int {
        func isWord(string: String) -> Bool {
            return !string.isEmpty && string.range(of: "[^a-zA-Z]", options: .regularExpression) == nil
        }
        
        let array = s.split(separator: " ").map({ String($0) }).reversed()
        for string in array {
            if isWord(string: string) {
                return string.count
            }
        }
        return 0
    }
    
    func run() {
        _ = lengthOfLastWord("Hello World")
    }
}
