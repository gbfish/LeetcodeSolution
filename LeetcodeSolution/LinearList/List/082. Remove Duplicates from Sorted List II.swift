/*
 82. Remove Duplicates from Sorted List II
 
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 For example,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3
 */

import Foundation

class Solution82: TestProtocol {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(Int.max)
        var previousOfDummy: ListNode? = dummy
        var previousOfHead: ListNode? = head
        
        var value: Int?
        var isFirstValue = true
        
        while previousOfHead != nil {
            if let theValue = value {
                if isFirstValue {
                    if previousOfHead!.val == value {
                        isFirstValue = false
                    } else {
                        previousOfDummy?.next = ListNode(theValue)
                        previousOfDummy = previousOfDummy?.next
                        
                        value = previousOfHead?.val
                        isFirstValue = true
                    }
                } else {
                    if previousOfHead!.val != value {
                        value = previousOfHead!.val
                        isFirstValue = true
                    }
                }
            } else {
                value = previousOfHead!.val
                isFirstValue = true
            }
            previousOfHead = previousOfHead?.next
        }
        
        if let theValue = value, isFirstValue {
            previousOfDummy?.next = ListNode(theValue)
        }
        return dummy.next
    }
    
    func run() {
        let listNode = ListNode(array: [1, 2, 3, 3, 4, 4, 5])
        _ = deleteDuplicates(listNode)
    }
}
