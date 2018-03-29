/*
 101. Symmetric Tree
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
 1
 / \
 2   2
 \   \
 3    3
 
 Note:
 Bonus points if you could solve it both recursively and iteratively.
 */

import Foundation

struct Solution101: TestProtocol {

    func isSymmetric(_ root: TreeNode?) -> Bool {
        func structure(treeNode: TreeNode?, leftToRight: Bool, result: inout [String]) -> () {
            if let treeNode = treeNode {
                result.append("\(treeNode.val)")
                if leftToRight == true {
                    structure(treeNode: treeNode.left, leftToRight: leftToRight, result: &result)
                    structure(treeNode: treeNode.right, leftToRight: leftToRight, result: &result)
                } else {
                    structure(treeNode: treeNode.right, leftToRight: leftToRight, result: &result)
                    structure(treeNode: treeNode.left, leftToRight: leftToRight, result: &result)
                }
            } else {
                result.append("nil")
            }
        }
        
        var structureLeft = [String]()
        structure(treeNode: root?.left, leftToRight: true, result: &structureLeft)
        
        var structureRight = [String]()
        structure(treeNode: root?.right, leftToRight: false, result: &structureRight)
        
        return structureLeft == structureRight
    }
    
    func run() {
        let root = TreeNode(5)
        _ = isSymmetric(root)
    }
}
