// 230720_4179_불!_백준_2회차
// https://www.acmicpc.net/problem/4179
// 18:45 ~ 19:45
// 엣지케이스..
//--------------------------------------------//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var sero = input[0]
var garo = input[1]

var board: [[String]] = []

var fireQueue: [(Int, Int)] = []
var personQueue: [(Int, Int)] = []
var visit: [[Int]] = Array(repeating: Array(repeating: -1, count: garo), count: sero)
var fireVisit: [[Int]] = Array(repeating: Array(repeating: -1, count: garo), count: sero)

for index in 0..<sero {
    let line = readLine()!.map { String($0) }
    board.append(line)
    
    for indexJ in 0..<line.count {
        if line[indexJ] == "F" {
            fireQueue.append((index, indexJ))
            fireVisit[index][indexJ] = 0
        } else if line[indexJ] == "J" {
            personQueue.append((index, indexJ))
            visit[index][indexJ] = 0
        }
    }
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

// 불이 번지는 시간 측정
var fireIndex = 0
while fireIndex < fireQueue.count {
    let cur = fireQueue[fireIndex]
    fireIndex += 1
    
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        
        if ny < 0 || nx < 0 || nx >= garo || ny >= sero { continue }
        if board[ny][nx] == "#" { continue }
        if fireVisit[ny][nx] != -1 { continue }
        
        fireQueue.append((ny, nx))
        fireVisit[ny][nx] = fireVisit[cur.0][cur.1] + 1
    }
}

var index = 0
var fastTime = sero * garo + 1
while index < personQueue.count {
    let cur = personQueue[index]
    index += 1
    
    if cur.1 == 0 || cur.1 == garo - 1 || cur.0 == 0 || cur.0 == sero - 1 {
        fastTime = min(visit[cur.0][cur.1], fastTime)
    }
    
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        
        if ny < 0 || nx < 0 || nx >= garo || ny >= sero { continue }
        if board[ny][nx] != "."  { continue }
        if visit[ny][nx] != -1 { continue }
        if fireVisit[ny][nx] != -1 && visit[cur.0][cur.1] + 1 >= fireVisit[ny][nx] { continue }
        
        personQueue.append((ny, nx))
        visit[ny][nx] = visit[cur.0][cur.1] + 1
    }
}

if fastTime == sero * garo + 1 {
    print("IMPOSSIBLE")
} else {
    print(fastTime + 1)
}
