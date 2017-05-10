//: Playground - noun: a place where people can play

import UIKit

func strPermute(s: String, prefix: String) {
    let strLen = s.characters.count
    if strLen == 0 {
        print(prefix, terminator: " ")
    } else {
        for index in 0..<strLen {
            let left = s.index(s.startIndex, offsetBy: index)
            let right = s.index(s.startIndex, offsetBy: index + 1)
            let rem = s.substring(to: left) + s.substring(from: right)
            strPermute(s: rem, prefix: (prefix + String(s[left])))
        }
    }
}

strPermute(s: "ABC", prefix: "")