/*
 143. Reorder List
 
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 You must do this in-place without altering the nodes' values.
 
 For example,
 Given {1,2,3,4}, reorder it to {1,4,2,3}.
 */

import Foundation

struct Solution143 {
    
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        
        var count = 0
        var pointer: ListNode? = head
        while pointer != nil {
            count += 1
            pointer = pointer?.next
        }
        
        let previousCount = (count + 1) / 2
        
        pointer = head
        for _ in 0..<(previousCount - 1) {
            pointer = pointer?.next
        }
        let trailingListNode = pointer?.next
        pointer?.next = nil
        
        var reverseTrailingListNode: ListNode? = ListNode(0)
        pointer = trailingListNode
        while pointer != nil {
            let nextListNode = ListNode(pointer!.val)
            nextListNode.next = reverseTrailingListNode?.next
            reverseTrailingListNode?.next = nextListNode
            
            pointer = pointer?.next
        }
        reverseTrailingListNode = reverseTrailingListNode?.next
        
        var leadingPointer: ListNode? = head
        var trailingPointer: ListNode? = reverseTrailingListNode
        
        
        while leadingPointer != nil {
            if let theTrailingPointer = trailingPointer {
                let listNode = ListNode(theTrailingPointer.val)
                listNode.next = leadingPointer?.next
                leadingPointer?.next = listNode
                
                trailingPointer = theTrailingPointer.next
            }
            leadingPointer = leadingPointer?.next?.next
        }
    }
    
    func run() {
        let head = ListNode(array: [1, 2, 3, 4, 5])
        reorderList(head)
    }
}
