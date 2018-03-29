/*
 102. Binary Tree Level Order Traversal
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its level order traversal as:
 [
 [3],
 [9,20],
 [15,7]
 ]
 */

import Foundation

struct Solution102: TestProtocol {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
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
        
        return array
    }
    
    func run() {
        let root = TreeNode(5)
        _ = levelOrder(root)
    }
}
