/*
 134. Gas Station
 
 here are N gas stations along a circular route, where the amount of gas at station i is gas[i].
 
 You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
 
 Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.
 
 Note:
 The solution is guaranteed to be unique.
 */

import Foundation

struct Solution134 {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var sumArray = [Int]()
        for index in 0..<gas.count {
            sumArray.append(gas[index] - cost[index])
        }
        
        for sumIndex in 0..<sumArray.count {
            var car = 0
            var isGood = true
            for index in 0..<sumArray.count {
                var temporaryIndex = index + sumIndex
                if temporaryIndex >= sumArray.count {
                    temporaryIndex -= sumArray.count
                }
                car += sumArray[temporaryIndex]
                if car < 0 {
                    isGood = false
                    break
                }
            }
            if isGood {
                return sumIndex
            }
        }
        return -1
    }
    
    func run() {
        let gas = [4]
        let cost = [5]
        _ = canCompleteCircuit(gas, cost)
    }
}
