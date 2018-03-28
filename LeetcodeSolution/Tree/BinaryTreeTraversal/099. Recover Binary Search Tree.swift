/*
 99. Recover Binary Search Tree
 
 Two elements of a binary search tree (BST) are swapped by mistake.
 
 Recover the tree without changing its structure.
 
 Note:
 A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
 */

import Foundation

struct Solution99 {
    
    func recoverTree(_ root: TreeNode?) {
        var previous: TreeNode? = nil
        var mistakeArray = [TreeNode]()
        
        func recursion(root: TreeNode?) {
            if let root = root {
                recursion(root: root.left)
                if previous != nil && root.val < previous!.val {
                    if mistakeArray.count == 0 {
                        mistakeArray.append(previous!)
                        mistakeArray.append(root)
                    } else {
                        mistakeArray[1] = root
                    }
                }
                previous = root
                recursion(root: root.right)
            }
        }
        
        recursion(root: root)
        
        let temporary = mistakeArray[0].val
        mistakeArray[0].val = mistakeArray[1].val
        mistakeArray[1].val = temporary
    }
    
    func run() {
        let root = TreeNode(5)
        _ = recoverTree(root)
    }
}
