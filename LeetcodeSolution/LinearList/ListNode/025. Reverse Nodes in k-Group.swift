/*
 25. Reverse Nodes in k-Group
 
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 You may not alter the values in the nodes, only nodes itself may be changed.
 
 Only constant memory is allowed.
 
 For example,
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 */

import Foundation

struct Solution25 {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var previousOfDummy: ListNode? = dummy
        
        var startPointer: ListNode? = dummy
        var endPointer: ListNode? = dummy
        
        for _ in 1...k {
            endPointer = endPointer?.next
        }
        
        while endPointer != nil {
            let reverseListNode = ListNode(0)
            
            for _ in 1...k {
                let listNode = ListNode(startPointer!.next!.val)
                listNode.next = reverseListNode.next
                reverseListNode.next = listNode
                
                startPointer = startPointer?.next
            }
            
            previousOfDummy?.next = reverseListNode.next
            
            while previousOfDummy?.next != nil {
                previousOfDummy = previousOfDummy?.next
            }
            
            for _ in 1...k {
                endPointer = endPointer?.next
            }
        }
        
        previousOfDummy?.next = startPointer?.next
        
        return dummy.next
    }
    
    func run() {
        let head = ListNode(array: [1, 2, 3, 4, 5])
        _ = reverseKGroup(head, 2)
    }
}
