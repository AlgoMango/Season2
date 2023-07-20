// 230720_14940번_쉬운최단거리_백준
// https://www.acmicpc.net/problem/14940
// 16:25 ~ 16:50

// ----------------------------------------//

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var sero = input[0]
var garo = input[1]

var board: [[Int]] = []
var visit: [[Int]] = Array(repeating: Array(repeating: -1, count: garo), count: sero)

var queue: [(Int, Int)] = []

for index in 0..<sero {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
    
    for indexJ in 0..<line.count {
        if line[indexJ] == 2 {
            queue.append((index, indexJ))
            visit[index][indexJ] = 0
        } else if line[indexJ] == 0 {   // 갈 수 없는 땅이면 Visit 0 처리
            visit[index][indexJ] = 0
        }
    }
}

// 2는 목표 지점, 0은 갈 수 없는 땅, 1은 갈 수 있는 땅
// 2를 시작 지점이라고 생각

let dx = [1, 0, -1 ,0]
let dy = [0, 1, 0, -1]

var index = 0
while index < queue.count {
    let cur = queue[index]
    index += 1
    
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        
        if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
        if visit[ny][nx] >= 0 { continue }   // 이미 방문을 한 상태
        if board[ny][nx] == 0 { continue }
        
        queue.append((ny, nx))
        visit[ny][nx] = visit[cur.0][cur.1] + 1
    }
}

// 출력
for item in visit {
    print(item.map { String($0) }.joined(separator: " "))
}
