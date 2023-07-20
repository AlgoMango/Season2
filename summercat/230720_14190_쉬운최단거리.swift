// 걸린시간: 30분

// 2 <= row, col <= 1_000
// 최대갯수 = 1_000_000
let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let row: Int = input[0]
let col: Int = input[1]

// 0 갈 수 없는 땅
// 1 갈 수 있는 땅
// 2 목표지점 -> 단 1개
var map: [[Int]] = Array(repeating: [Int](), count: row)
var target: (row: Int, col: Int) = (0, 0)

for i in 0..<row {
    let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    map[i] = line
    for j in 0..<col {
        if line[j] == 2 { target = (row: i, col: j) }
    }
}

// 각 지점에서 목표지점까지의 거리를 출력
// 원래 갈 수 없는 땅 = 0
// 갈 수 있는데 도달 불가 = -1

// 목표지점(2)에서 출발하면서 최소값 갱신

let dr: [Int] = [0, 0, 1, -1]
let dc: [Int] = [1, -1, 0, 0]
var answer: [[Int]] = Array(repeating: Array(repeating: 1_000_001, count: col), count: row)

func solve() {
    bfs(r: target.row, c: target.col)
    checkUnvisited()
    
    for line in answer {
        print(line.map{ String($0) }.joined(separator: " "))
    }
}

func bfs(r: Int, c: Int) {
    var queue: [(r: Int, c: Int, count: Int)] = [(r: r, c: c, count: 0)]
    var idx: Int = 0
    answer[target.row][target.col] = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        for i in 0..<4 {
            let nr = cur.r + dr[i]
            let nc = cur.c + dc[i]
            
            if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
            if answer[nr][nc] <= cur.count + 1 { continue }
            if map[nr][nc] == 0 {
                answer[nr][nc] = 0
            }
            else {
                answer[nr][nc] = cur.count + 1
                queue.append((r: nr, c: nc, count: cur.count + 1))
            }
        }
        
        idx += 1
    }
}

func checkUnvisited() {
    for i in 0..<row {
        for j in 0..<col {
            if answer[i][j] == 1_000_001 {
                answer[i][j] = map[i][j] == 0 ? 0 : -1
            }
        }
    }
}

solve()
