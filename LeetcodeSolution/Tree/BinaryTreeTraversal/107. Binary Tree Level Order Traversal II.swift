/*
 107. Binary Tree Level Order Traversal II
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
 ]
 */

import Foundation

struct Solution107 {
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var stack = [TreeNode]()
        var array = [[Int]]()
        
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
                array.append(newArray)
            }
        }
        
        return array.reversed()
    }
    
    func run() {
        let root = TreeNode(5)
        _ = levelOrderBottom(root)
    }
}
