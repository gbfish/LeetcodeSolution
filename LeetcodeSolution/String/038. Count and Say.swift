/*
 38. Count and Say
 
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 Given an integer n, generate the nth term of the count-and-say sequence.
 
 Note: Each term of the sequence of integers will be represented as a string.
 
 Example 1:
 
 Input: 1
 Output: "1"
 Example 2:
 
 Input: 4
 Output: "1211"
 */

import Foundation

struct Solution38 {
    
    func countAndSay(_ n: Int) -> String {
        
        func next(number: String) -> String {
            var returnValue = ""
            var theNumber = number
            
            while theNumber.count > 0 {
                var firstString: String?
                var count = 0
                
                while theNumber.count > 0 {
                    let firstStringFromNumber = String(theNumber.first!)
                    if let theFirstString = firstString {
                        if theFirstString == firstStringFromNumber {
                            count += 1
                            _ = theNumber.removeFirst()
                        } else {
                            break
                        }
                    } else {
                        firstString = firstStringFromNumber
                        count = 1
                        _ = theNumber.removeFirst()
                    }
                }
                if let theFirstString = firstString {
                    returnValue += "\(count)\(theFirstString)"
                }
            }
            return returnValue
        }
        
        var number = "1"
        for _ in 1..<n {
            number = next(number: number)
            print("\(number)")
        }
        return number
    }
    
    func run() {
        _ = countAndSay(4)
    }
}
