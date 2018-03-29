/*
 61. Rotate List
 
 Given a list, rotate the list to the right by k places, where k is non-negative.
 
 
 Example:
 
 Given 1->2->3->4->5->NULL and k = 2,
 
 return 4->5->1->2->3->NULL.
 */
import Foundation

struct Solution61: TestProtocol {
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var previousOfHead: ListNode? = head
        var count = 1
        while previousOfHead?.next != nil {
            count += 1
            previousOfHead = previousOfHead?.next
        }
        
        var step = count - (k % count)
        previousOfHead?.next = head
        previousOfHead = head
        while step > 0 {
            step -= 1
            previousOfHead = previousOfHead?.next
        }
        
        let dummy = ListNode(0)
        dummy.next = previousOfHead?.next
        previousOfHead?.next = nil
        return dummy.next
    }
    
    func run() {
        let head = ListNode(array: [1, 2, 3, 4, 5])
        _ = rotateRight(head, 0)
    }
}
