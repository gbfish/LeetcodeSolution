/*
 73. Set Matrix Zeroes
 
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.
 
 Follow up:
 Did you use extra space?
 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 */

import Foundation

struct Solution73 {
    
    func setZeroes(_ matrix: inout [[Int]]) {
        let rowsDetector = matrix.map({ $0.filter({ $0 == 0 }).count > 0 })
        
        var columnsDetector = [Bool]()
        for columnIndex in 0..<matrix.first!.count {
            columnsDetector.append(matrix.map({ $0[columnIndex] }).filter({ $0 == 0 }).count > 0)
        }
        
        for rowIndex in 0..<matrix.count {
            for columnIndex in 0..<matrix[rowIndex].count {
                if rowsDetector[rowIndex] == true || columnsDetector[columnIndex] == true {
                    matrix[rowIndex][columnIndex] = 0
                }
            }
        }
    }
    
    func run() {
        var matrix = [[1, 0], [3, 4]]
        setZeroes(&matrix)
    }
}
