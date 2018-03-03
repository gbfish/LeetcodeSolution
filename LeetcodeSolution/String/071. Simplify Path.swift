/*
 71. Simplify Path
 
 Given an absolute path for a file (Unix-style), simplify it.
 
 For example,
 path = "/home/", => "/home"
 path = "/a/./b/../../c/", => "/c"
 */

import Foundation

struct Solution71 {
    
    func simplifyPath(_ path: String) -> String {
        let array = path.split(separator: "/").map({ String($0) })
        var stack = [String]()
        for string in array {
            if string == "" || string == "." {
                continue
            }
            if string == ".." {
                _ = stack.popLast()
                continue
            }
            stack.append(string)
        }
        return stack.isEmpty ? "/" : "/" + stack.joined(separator:"/")
    }
    
    func run() {
        _ = simplifyPath("/home/")
    }
}
