// DP로 풇다가 논리의 허점을 발견했는데 어케해야할ㅈ ㅣ모르겟음
// BFS도 고민해볼게요

import Foundation

// 시작시간 15:17
let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n = input[0]
let k = input[1]

var position: [Int] = Array(repeating: 100_001, count: 100_001)
position[n] = 0

func solve() -> Int {
    if n >= k { return n - k }
    
    for i in 0..<n {
        position[i] = n - i
    }
    
    for i in 0...n {
        fillMulti(i)
    }
    
    for i in (n + 1)...100_000 {
        if i % 2 == 0 {
            if i == 100_000 {
                position[i] = min(position[i - 1] + 1, position[i / 2])
            } else {
                position[i] = min(position[i - 1] + 1, position[i + 1] + 1, position[i / 2])
            }
        } else {
            position[i] = min(position[i - 1] + 1, position[i + 1] + 1)
        }
    }
    
    return position[k]
}

func fillMulti(_ cur: Int) {
    var temp: Int = cur
    
    while temp <= 100_000 {
        if temp == 0 { break }
        position[temp] = min(position[temp], position[cur])
        temp *= 2
    }
}

print(solve())
