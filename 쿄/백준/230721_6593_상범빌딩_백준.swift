// 230721_6593_상범빌딩_백준
// https://www.acmicpc.net/problem/6593
// 10:40 ~ 11:00
//--------------------------------------------//

// 동서남북상하 이동 기능/ 이동마다 1분 소요 / 대각선불가
// 출구를 통해서만 탈출 가능

let dz = [0, 0, 0, 0, 1, -1]
let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]

var answer: [Int] = []

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if input == [0, 0, 0] { break }
    
    let floor = input[0]
    let sero = input[1]
    let garo = input[2]
    
    // Board Input
    var board: [[[String]]] = []
    var queue: [(Int, Int, Int)] = []
    for l in 0..<floor {
        var temp: [[String]] = []
        
        for row in 0..<sero {
            let line = readLine()!.map { String($0) }
            temp.append(line)
            
            if !queue.isEmpty { continue }
            for col in 0..<line.count {
                if line[col] == "S" {
                    // 시작 부분
                    queue.append((l, row, col))
                }
            }
        }
        
        board.append(temp)
        let blankLine = readLine()!
    }
    
    var visit: [[[Int]]] = Array(
        repeating: Array(repeating: Array(repeating: -1, count: garo), count: sero),
        count: floor
    )
    // 시작위치 Vist 배열 세팅
    visit[queue.first!.0][queue.first!.1][queue.first!.2] = 0
    
    var index = 0
    var flag = false
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        if board[cur.0][cur.1][cur.2] == "E" {
            print("Escaped in \(visit[cur.0][cur.1][cur.2]) minute(s).")
            flag = true
            break
        }
        
        for dir in 0..<dx.count {
            let nz = cur.0 + dz[dir]
            let ny = cur.1 + dy[dir]
            let nx = cur.2 + dx[dir]
            
            if nz < 0 || ny < 0 || nx < 0 || nz >= floor || ny >= sero || nx >= garo { continue }
            if board[nz][ny][nx] == "#" { continue }
            if visit[nz][ny][nx] != -1 { continue }
            
            queue.append((nz, ny, nx))
            visit[nz][ny][nx] = visit[cur.0][cur.1][cur.2] + 1
        }
    }
    
    if !flag {
        print("Trapped!")
    }
}
