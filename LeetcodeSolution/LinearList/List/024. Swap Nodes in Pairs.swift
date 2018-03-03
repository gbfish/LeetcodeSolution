/*
 24. Swap Nodes in Pairs
 
 Given a linked list, swap every two adjacent nodes and return its head.
 
 For example,
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
 */

import Foundation

struct Solution24 {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var previousOfDummy: ListNode? = dummy
        
        while previousOfDummy?.next?.next != nil {
            let nextOfDummy = ListNode(previousOfDummy!.next!.val)
            previousOfDummy?.next = previousOfDummy?.next?.next
            nextOfDummy.next = previousOfDummy?.next?.next
            previousOfDummy?.next?.next = nextOfDummy
            previousOfDummy = previousOfDummy?.next?.next
        }
        
        return dummy.next
    }
    
    func run() {
        let head = ListNode(array: [1, 2, 3, 4])
        _ = swapPairs(head)
    }
}
