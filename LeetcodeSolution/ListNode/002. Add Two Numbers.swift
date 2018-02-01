/*
 2. Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
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

struct Solution2 {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func add(listNode1: ListNode?, listNode2: ListNode?) -> ListNode? {
            let result = ListNode((listNode1?.val ?? 0) + (listNode2?.val ?? 0))
            if listNode1?.next != nil || listNode2?.next != nil {
                result.next = add(listNode1: listNode1?.next, listNode2: listNode2?.next)
            }
            return result
        }

        func check(listNode: ListNode?) {
            if let listNodeValue = listNode?.val, listNodeValue >= 10 {
                listNode?.val = listNodeValue - 10
                if let listNodeNext = listNode?.next {
                    listNode?.next?.val = listNodeNext.val + 1
                } else {
                    listNode?.next = ListNode(1)
                }
            }
            if listNode?.next != nil {
                check(listNode: listNode?.next)
            }
        }
        
        let answer = add(listNode1: l1, listNode2: l2)
        check(listNode: answer)
        return answer
    }
    
    func run() {
        let l1 = ListNode(2)
        let l1Next1 = ListNode(4)
        let l1Next2 = ListNode(3)
        l1.next = l1Next1
        l1Next1.next = l1Next2
        
        let l2 = ListNode(5)
        let l2Next1 = ListNode(6)
        let l2Next2 = ListNode(4)
        l2.next = l2Next1
        l2Next1.next = l2Next2
        
        _ = addTwoNumbers(l1, l2)
    }
}
