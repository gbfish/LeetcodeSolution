/*
 94. Binary Tree Inorder Traversal
 
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 For example:
 Given binary tree [1,null,2,3],
 1
 \
 2
 /
 3
 return [1,3,2].
 */

import Foundation

struct Solution94 {
    
    // left -> root -> right
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var array = [Int]()
        if let root = root {
            stack.append(root)
            
            while stack.count > 0 {
                let last = stack.removeLast()
                if let right = last.right {
                    stack.append(right)
                    last.right = nil
                }
                stack.append(last)
                if let left = last.left {
                    stack.append(left)
                    last.left = nil
                }
                
                if let newLast = stack.last, newLast.left == nil, newLast.right == nil {
                    array.append(newLast.val)
                    _ = stack.removeLast()
                }
            }
        }
        return array
    }
    
    func run() {
        let root = TreeNode(5)
        _ = inorderTraversal(root)
    }
    
    // recursion
    
    func inorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        func recursion(root: TreeNode?, result: inout [Int]) {
            if let root = root {
                recursion(root: root.left, result: &result)
                result.append(root.val)
                recursion(root: root.right, result: &result)
            }
        }
        
        var result = [Int]()
        recursion(root: root, result: &result)
        return result
    }
}
