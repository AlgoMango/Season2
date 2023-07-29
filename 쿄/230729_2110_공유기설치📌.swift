// 230729_2110_공유기설치
// https://www.acmicpc.net/problem/2110
//--------------------------------------------//

// 한 집에 공유기는 1개만
// 최대한 많은 곳에서 와이파이 사용 가능하게,
// 두 공유기 사이거리를 최대로

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let home = input[0]
var wifi = input[1]

var board: [Int] = []
var visit: [Bool] = Array(repeating: false, count: home)

for _ in 0..<home {
    board.append(Int(readLine()!)!)
}

board = board.sorted(by: <)


var start = 0
var end = home - 1
visit[start] = true
visit[end] = true
wifi = wifi - 2

while wifi > 0 {
    if start + end % 2 == 0 {
        visit[(start + end) / 2] = true
        wifi -= 1
        continue
    }
    
    var target = (start + end) / 2
    
    if board[end] - board[target] < board[target] - board[start] {
        visit[(start + end) / 2] = true
        end = target
        wifi -= 1
        continue
    }
    visit[((start + end) / 2) + 1] = true
    start = target
    wifi -= 1
}

var answer: [Int] = []

var startIndex = -1

for index in 0..<visit.count {
    if visit[index] && startIndex == -1 {
        startIndex = index
        continue
    }
    
    if visit[index] && startIndex != -1 {
        answer.append(board[index] - board[startIndex])
        startIndex = index
    }
}

print(answer.min()!)
