// DP로 풇다가 논리의 허점을 발견했는데 어케해야할지 모르겟음 -> 결국 못품
// BFS -> 20분?

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n = input[0]
let k = input[1]

var position: [Int] = Array(repeating: 100_001, count: 100_001)
position[n] = 0

func bfs(_ cur: Int, count: Int) {
    var queue: [(pos: Int, count: Int)] = [(pos: cur, count: count)]
    var idx: Int = 0
    
    while idx < queue.count {
        let current = queue[idx]
        
        let prev = current.pos - 1
        let next = current.pos + 1
        let doub = current.pos * 2
        
        if doub <= 100_000 && doub != current.pos && current.count < position[doub] {
            position[doub] = current.count
            queue.append((pos: doub, count: current.count))
        }
        if prev >= 0 && current.count + 1 < position[prev] {
            position[prev] = current.count + 1
            queue.append((pos: prev, count: current.count + 1))
        }
        if next <= 100_000 && current.count + 1 < position[next] {
            position[next] = current.count + 1
            queue.append((pos: next, count: current.count + 1))
        }
        
        idx += 1
    }
}

bfs(n, count: 0)
print(position[k])
