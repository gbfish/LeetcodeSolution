/*
 145. Binary Tree Postorder Traversal
 
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 For example:
 Given binary tree [1,null,2,3],
 1
 \
 2
 /
 3
 return [3,2,1].
 */

import Foundation

struct Solution145: TestProtocol {
    
    // left -> right -> root
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var array = [Int]()
        if let root = root {
            stack.append(root)
            
            while stack.count > 0 {
                let last = stack.removeLast()
                stack.append(last)
                if let right = last.right {
                    stack.append(right)
                    last.right = nil
                }
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
        _ = postorderTraversal(root)
    }
    
    // recursion
    
    func postorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
        func recursion(root: TreeNode?, result: inout [Int]) {
            if let root = root {
                recursion(root: root.left, result: &result)
                recursion(root: root.right, result: &result)
                result.append(root.val)
            }
        }
        
        var result = [Int]()
        recursion(root: root, result: &result)
        return result
    }
}
