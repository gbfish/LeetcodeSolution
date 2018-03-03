/*
 144. Binary Tree Preorder Traversal
 
 Given a binary tree, return the preorder traversal of its nodes' values.
 
 For example:
 Given binary tree [1,null,2,3],
 1
 \
 2
 /
 3
 return [1,2,3].
 */

import Foundation

struct Solution144 {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var array = [Int]()
        if root != nil {
            stack.append(root!)
            while stack.count > 0 {
                let last = stack.removeLast()
                array.append(last.val)
                if let right = last.right {
                    stack.append(right)
                }
                if let left = last.left {
                    stack.append(left)
                }
            }
        }
        return array
    }
    
    func run() {
        let root = TreeNode(5)
        _ = preorderTraversal(root)
    }
    
    // Recursive
    
    func preorderTraversalRecursive(_ root: TreeNode?) -> [Int] {
        func recursive(root: TreeNode?, result: inout [Int]) {
            if let root = root {
                result.append(root.val)
                recursive(root: root.left, result: &result)
                recursive(root: root.right, result: &result)
            }
        }
        
        var result = [Int]()
        recursive(root: root, result: &result)
        return result
    }
}