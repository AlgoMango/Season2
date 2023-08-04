import Foundation

// 00: 26 ~ 이게 시간초과가 나면 어쩌란말인가

let info = readLine()!.split(separator: " ").map { Int($0)! }

let keywordCount = info[0]
let writingCount = info[1]

var keywordsDictionary: [String: Bool] = [:]

var 메모장에있는키워드개수: Int = keywordCount
var result: String = ""

for _ in 1...keywordCount {
    let keyword = readLine()!
    keywordsDictionary[keyword] = false
}

for count in 1...writingCount {
    let writing = readLine()!.split(separator: ",").map { String($0) }
    
    writing.forEach {
        if keywordsDictionary[$0] != nil && keywordsDictionary[$0] == false {
            메모장에있는키워드개수 -= 1
            keywordsDictionary[$0] = true
        }
    }
    
    if count == 1 {
        result += "\(메모장에있는키워드개수)"
    } else {
        result += "\n\(메모장에있는키워드개수)"
    }
}

print(result)
