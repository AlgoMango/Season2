// 40분

import Foundation

// 시작시간 15:03

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n: Int = input[0]
let l: Int = input[1]
let r: Int = input[2]
var map: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var answer: Int = 0

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    map.append(line)
}

// 인구수의 차가 l이상 r 이하일때만 연합

func solve() {
    while true {
        var flag: Bool = false
        
        for i in 0..<n {
            for j in 0..<n {
                if visited[i][j] { continue }
                let result = bfs(row: i, col: j)
                flag = flag || result
            }
        }

        if flag == false { return }
        answer += 1
        // 끝까지 돌고 나면 초기화
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
    }
}

solve()
print(answer)

func bfs(row: Int, col: Int) -> Bool {
    var queue: [(r: Int, c: Int)] = [(r: row, c: col)]
    var idx: Int = 0
    visited[row][col] = true
    
    while idx < queue.count {
        let cur = queue[idx]
        
        for i in 0..<4 {
            let nr = cur.r + dr[i]
            let nc = cur.c + dc[i]
            
            if nr < 0 || nr >= n || nc < 0 || nc >= n { continue }
            if visited[nr][nc] { continue }
            
            let diff = abs(map[cur.r][cur.c] - map[nr][nc])
            if diff >= l && diff <= r {
                queue.append((r: nr, c: nc))
                visited[nr][nc] = true
            }
        }
        
        idx += 1
    }
    
    if queue.count == 1 { return false }
    
    reallocate(nodes: queue)
    
    return true
}

func reallocate(nodes: [(r: Int, c: Int)]) {
    var sum: Int = 0
    
    for node in nodes {
        sum += map[node.r][node.c]
    }
    
    let average: Int = sum / nodes.count
    
    for node in nodes {
        map[node.r][node.c] = average
    }
}
