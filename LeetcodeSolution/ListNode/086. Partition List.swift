/*
 86. Partition List
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
 */

import Foundation

class Solution86 {
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(0)
        var previousOfDummy: ListNode? = dummy
        
        var previousOfHead: ListNode? = head
        
        while previousOfHead != nil {
            if previousOfHead!.val < x {
                previousOfDummy?.next = ListNode(previousOfHead!.val)
                previousOfDummy = previousOfDummy?.next
            }
            previousOfHead = previousOfHead?.next
        }
        
        previousOfHead = head
        while previousOfHead != nil {
            if previousOfHead!.val >= x {
                previousOfDummy?.next = ListNode(previousOfHead!.val)
                previousOfDummy = previousOfDummy?.next
            }
            previousOfHead = previousOfHead?.next
        }
        
        return dummy.next
    }
    
    func run() {
        let listNode = ListNode(array: [1, 4, 3, 2, 5, 2])
        _ = partition(listNode, 3)
    }
}
