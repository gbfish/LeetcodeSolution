/*
 49. Group Anagrams
 
 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 */

import Foundation

struct Solution49 {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        func count(string: String) -> String {
            var theString = string
            var dictionary = [String: Int]()
            while theString.count > 0 {
                let first = String(theString.removeFirst())
                dictionary[first] = (dictionary[first] ?? 0) + 1
            }
            let array = dictionary.sorted(by: { $0.key < $1.key })
            return array.reduce("", { "\($0)\($1.value)\($1.key)" })
        }
        
        var mainDictionary = [String: [String]]()
        for string in strs {
            let key = count(string: string)
            if var array = mainDictionary[key] {
                array.append(string)
                mainDictionary[key] = array
            } else {
                mainDictionary[key] = [string]
            }
        }
        return mainDictionary.map({ $0.value })
    }
    
    func run() {
        _ = groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    }
}
