/*
 135. Candy
 
 There are N children standing in a line. Each child is assigned a rating value.
 
 You are giving candies to these children subjected to the following requirements:
 
 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 What is the minimum candies you must give?
 */

import Foundation

struct Solution135: TestProtocol {
    
    func candy(_ ratings: [Int]) -> Int {
        var candyArray = Array<Int>(repeatElement(1, count: ratings.count))
        for index in 1..<ratings.count {
            if ratings[index - 1] < ratings[index] {
                candyArray[index] = candyArray[index - 1] + 1
            }
        }
        for index in stride(from: ratings.count - 2, through: 0, by: -1) {
            if ratings[index + 1] < ratings[index] && candyArray[index + 1] >= candyArray[index] {
                candyArray[index] = candyArray[index + 1] + 1
            }
        }
        return candyArray.reduce(0, +)
    }
    
    func run() {
        let ratings = [1, 3, 5]
        _ = candy(ratings)
    }
}
