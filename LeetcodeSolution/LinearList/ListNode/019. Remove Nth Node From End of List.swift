/*
 19. Remove Nth Node From End of List
 
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
 */

import Foundation

struct Solution19 {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        var startPointer: ListNode? = dummy
        var endPointer: ListNode? = dummy
        
        for _ in 1...n {
            endPointer = endPointer?.next
        }
        
        while endPointer?.next != nil {
            startPointer = startPointer?.next
            endPointer = endPointer?.next
        }
        
        startPointer?.next = startPointer?.next?.next
        return dummy.next
    }
    
    func run() {
        let head = ListNode(array: [1, 2, 3, 4, 5])
        _ = removeNthFromEnd(head, 2)
    }
}
