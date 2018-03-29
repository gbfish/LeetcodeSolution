/*
 103. Binary Tree Zigzag Level Order Traversal
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its zigzag level order traversal as:
 [
 [3],
 [20,9],
 [15,7]
 ]
 */

import Foundation

struct Solution103: TestProtocol {
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var stack = [TreeNode]()
        var array = [[Int]]()
        var isLeftToRight = true
        
        if let root = root {
            stack.append(root)
            
            while stack.count > 0 {
                var newStack = [TreeNode]()
                var newArray = [Int]()
                
                for treeNode in stack {
                    newArray.append(treeNode.val)
                    if let left = treeNode.left {
                        newStack.append(left)
                    }
                    if let right = treeNode.right {
                        newStack.append(right)
                    }
                }
                
                stack = newStack
                array.append(isLeftToRight ? newArray : newArray.reversed())
                isLeftToRight = !isLeftToRight
            }
        }
        
        return array
    }
    
    func run() {
        let root = TreeNode(5)
        _ = zigzagLevelOrder(root)
    }
}
