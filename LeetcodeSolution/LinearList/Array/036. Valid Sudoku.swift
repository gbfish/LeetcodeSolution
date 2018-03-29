/*
 36. Valid Sudoku
 
 Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 
 A partially filled sudoku which is valid.
 
 Note:
 A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.
 */

import Foundation

struct Solution36: TestProtocol {
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isValidArray(array: [Character]) -> Bool {
            var set = Set<Character>()
            for character in array {
                if character != Character(".") {
                    if set.contains(character) {
                        return false
                    } else {
                        set.insert(character)
                    }
                }
            }
            return true
        }
        for index in 0..<9 {
            if isValidArray(array: board[index]) == false {
                return false
            }
            if isValidArray(array: board.map({ $0[index] })) == false {
                return false
            }
        }
        
        for baseSectionIndex in 0..<3 {
            for baseRowIndex in 0..<3 {
                var squareArray = [Character]()
                for sectionIndex in (baseSectionIndex * 3)..<(baseSectionIndex * 3 + 3) {
                    for rowIndex in (baseRowIndex * 3)..<(baseRowIndex * 3 + 3) {
                        squareArray.append(board[sectionIndex][rowIndex])
                    }
                }
                if isValidArray(array:squareArray) == false {
                    return false
                }
            }
        }
        return true
    }
    
    func run() {
        let inputBoard = [[".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."],[".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]]
        let board = inputBoard.map({ $0.map({ Character($0) }) })
        _ = isValidSudoku(board)
    }
}
