/*
 100. Same Tree
 
 Given two binary trees, write a function to check if they are the same or not.
 
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 
 Example 1:
 
 Input:     1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 Output: true
 Example 2:
 
 Input:     1         1
 /           \
 2             2
 
 [1,2],     [1,null,2]
 
 Output: false
 Example 3:
 
 Input:     1         1
 / \       / \
 2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 Output: false
 */

import Foundation

struct Solution: TestProtocol {
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        func structure(treeNode: TreeNode?, result: inout [String]) -> ()  {
            if let treeNode = treeNode {
                result.append("\(treeNode.val)")
                structure(treeNode: treeNode.left, result: &result)
                structure(treeNode: treeNode.right, result: &result)
            } else {
                result.append("nil")
            }
        }
        
        var structureP = [String]()
        structure(treeNode: p, result: &structureP)
        
        var structureQ = [String]()
        structure(treeNode: q, result: &structureQ)
        
        return structureP == structureQ
    }
    
    func run() {
        let p = TreeNode(4)
        let q = TreeNode(5)
        _ = isSameTree(p, q)
    }
}
