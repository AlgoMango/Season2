// 230727_13549_숨바꼭질3
// https://www.acmicpc.net/problem/13549
// 17:27 ~ 17:45
//--------------------------------------------//

// 순간이동은 0초 걸림, -1, +1 칸 이동은 1초 걸림
// 가장 빠른 시간은 몇초?

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = input[0]
var end = input[1]

var maxNumber = 100001

var board: [Int] = Array(repeating: -1, count: maxNumber)
var visit: [Bool] = Array(repeating: false, count: maxNumber)

board[start] = 0

var queue: [Int] = [start]
visit[start] = true

var index = 0
while board[end] == -1 {
    
    let cur = queue[index]
    index += 1

  // 0초 소요되는 것부터 먼저 Queue에 넣어야한다.
    for newLocation in [cur * 2, cur - 1, cur + 1] {
        if newLocation < 0 || newLocation >= maxNumber { continue }
        if visit[newLocation] || board[newLocation] != -1 { continue }
        
        visit[newLocation] = true
        if newLocation == cur * 2 {
            board[newLocation] = board[cur]
        } else {
            board[newLocation] = board[cur] + 1
        }
        
        queue.append(newLocation)
    }
}

print(board[end])
