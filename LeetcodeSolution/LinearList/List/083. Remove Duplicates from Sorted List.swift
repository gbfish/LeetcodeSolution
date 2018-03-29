/*
 83. Remove Duplicates from Sorted List
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 */

import Foundation

class Solution83: TestProtocol {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(Int.max)
        var previousOfDummy: ListNode? = dummy
        var previousOfHead: ListNode? = head
        
        while previousOfHead != nil {
            if previousOfDummy!.val != previousOfHead!.val {
                previousOfDummy?.next = ListNode(previousOfHead!.val)
                previousOfDummy = previousOfDummy?.next
            }
            previousOfHead = previousOfHead?.next
        }
        return dummy.next
    }
    
    func run() {
        let listNode = ListNode(array: [1, 1, 2])
        _ = deleteDuplicates(listNode)
    }
}
