//
//  ListNode.swift
//  LeetcodeSolution
//
//  Created by David Yu on 2018/2/1.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init?(array: [Int]) {
        let dummy = ListNode(0)
        var previousOfDummy: ListNode? = dummy
        for number in array {
            previousOfDummy?.next = ListNode(number)
            previousOfDummy = previousOfDummy?.next
        }
        
        if let dummyNext = dummy.next {
            self.val = dummyNext.val
            self.next = dummyNext.next
        } else {
            return nil
        }
    }
}

/*
 138. Copy List with Random Pointer
 141. Linked List Cycle
 142. Linked List Cycle II
 146. LRU Cache
 
 There is no Swift.
 */
