/*
 60. Permutation Sequence
 
 The set [1,2,3,…,n] contains a total of n! unique permutations.
 
 By listing and labeling all of the permutations in order,
 We get the following sequence (ie, for n = 3):
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.
 
 Note: Given n will be between 1 and 9 inclusive.
 */

import Foundation

struct Solution60: TestProtocol {
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        func division(numerator: Int, denominator: Int) -> (quotient: Int, remainder: Int) {
            let quotient = numerator/denominator
            let remainder = numerator%denominator
            return (quotient, remainder)
        }
        
        func factorial(number: Int) -> Int {
            var result = 1
            for index in 1...number {
                result *= index
            }
            return result
        }
        
        var array = [Int]()
        for index in 0..<n {
            array.append(index + 1)
        }
        
        var answerArray = [Int]()
        var numerator = k - 1
        for index in stride(from: n - 1, to: 0, by: -1) {
            let result = division(numerator: numerator, denominator: factorial(number: index))
            answerArray.append(array.remove(at: result.quotient))
            numerator = result.remainder
        }
        answerArray.append(array.first!)
        
        return answerArray.map({ String($0) }).reduce("", +)
    }
    
    func getPermutationOneByOne(_ n: Int, _ k: Int) -> String {
        var array = [Int]()
        for index in 0..<n {
            array.append(index + 1)
        }
        
        for _ in 0..<(k - 1) {
            let solution31 = Solution31()
            _ = solution31.nextPermutation(&array)
        }
        return array.map({ String($0) }).reduce("", +)
    }
    
    func run() {
        _ = getPermutation(3, 1)
    }
}
