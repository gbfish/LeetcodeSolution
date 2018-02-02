/*
 89. Gray Code
 
 The gray code is a binary numeral system where two successive values differ in only one bit.
 
 Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.
 
 For example, given n = 2, return [0,1,3,2]. Its gray code sequence is:
 
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 Note:
 For a given n, a gray code sequence is not uniquely defined.
 
 For example, [0,2,3,1] is also a valid gray code sequence according to the above definition.
 
 For now, the judge is able to judge based on one instance of gray code sequence. Sorry about that.
 */

import Foundation

struct Solution89 {
    
    struct GrayCodeInerator: IteratorProtocol {
        var grayCode = ["0", "1"]

        mutating func next() -> [String]? {
            var newGrayCode = [String]()
            for number in grayCode {
                newGrayCode.append("0\(number)")
            }
            for number in grayCode.reversed() {
                newGrayCode.append("1\(number)")
            }
            grayCode = newGrayCode
            return grayCode
        }
    }
    
    func grayCode(_ n: Int) -> [Int] {
        func binaryToDecimal(binary: String) -> Int {
            var sum = 0
            for bit in binary {
                sum = sum * 2 + Int(String(bit))!
            }
            return sum
        }
        
        if n == 0 {
            return [0]
        }
        
        var grayCodeInerator = GrayCodeInerator()
        for _ in 1..<n {
            _ = grayCodeInerator.next()
        }
        return grayCodeInerator.grayCode.map({ binaryToDecimal(binary: $0) })
    }
    
    func run() {
        _ = grayCode(2)
    }
}
