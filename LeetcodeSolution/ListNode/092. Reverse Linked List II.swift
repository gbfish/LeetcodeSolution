/*
 92. Reverse Linked List II
 
 Reverse a linked list from position m to n. Do it in-place and in one-pass.
 
 For example:
 Given 1->2->3->4->5->NULL, m = 2 and n = 4,
 
 return 1->4->3->2->5->NULL.
 
 Note:
 Given m, n satisfy the following condition:
 1 ≤ m ≤ n ≤ length of list.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

import Foundation

struct Solution92 {
    
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        var previousOfDummy: ListNode? = dummy
        var previousOfHead: ListNode? = head
        
        for _ in 1..<m {
            previousOfDummy?.next = previousOfHead
            
            previousOfDummy = previousOfDummy?.next
            previousOfHead = previousOfHead?.next
        }
        
        let dummyMiddle = ListNode(0)
        for _ in m...n {
            let dummyMiddleNext = dummyMiddle.next
            dummyMiddle.next = previousOfHead
            
            previousOfHead = previousOfHead?.next
            
            dummyMiddle.next?.next = dummyMiddleNext
        }
        previousOfDummy?.next = dummyMiddle.next
        while previousOfDummy?.next != nil {
            previousOfDummy = previousOfDummy?.next
        }
        
        while previousOfHead != nil {
            previousOfDummy?.next = previousOfHead
            previousOfDummy = previousOfDummy?.next

            previousOfHead = previousOfHead?.next
        }
        
        return dummy.next
    }
    
    func run() {
        let listNode = ListNode(array: [1, 2, 3, 4, 5])
        _ = reverseBetween(listNode, 1, 1)
    }
}
