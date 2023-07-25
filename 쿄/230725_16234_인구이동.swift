// 230725_16234_인구이동
// https://www.acmicpc.net/problem/16234
// 21:50 ~ 10:31
//--------------------------------------------//
// 인구차이가 minNumber이상 maxNumber이하면 국경선을 연다.

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let line = input[0]
let minNumber = input[1]
let maxNumber = input[2]

var board: [[Int]] = []

for _ in 0..<line {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

let dx = [1, 0, -1 ,0]
let dy = [0, 1, 0, -1]

var answer = 0

// 계속 돌아야한다
while true {
    var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: line), count: line)
    var flag = false
    
    for sero in 0..<line {
        for garo in 0..<line {
            if visit[sero][garo] { continue }
            
            var queue: [(Int, Int)] = [(sero, garo)]
            var index = 0
            
            visit[sero][garo] = true
            var total = board[sero][garo]
            
            while index < queue.count {
                let cur = queue[index]
                index += 1
                
                for dir in 0..<dx.count {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if ny < 0 || nx < 0 || ny >= line || nx >= line { continue }
                    if visit[ny][nx] { continue }
                    if abs(board[cur.0][cur.1] - board[ny][nx]) >= minNumber && abs(board[cur.0][cur.1] - board[ny][nx]) <= maxNumber {
                        visit[ny][nx] = true
                        total += board[ny][nx]
                        queue.append((ny, nx))
                        flag = true // 국경 열림
                    }
                }
            }
            
            // 인구 수 뿜빠이
            for item in queue {
                board[item.0][item.1] = total / queue.count
            }
        }
    }
    
    // 국경 한번이라도 열렸으면 asnwer += 1
    if !flag { break }
    else { answer += 1 }
}

print(answer)
