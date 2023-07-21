// 230721_14719_빗물_백준
// https://www.acmicpc.net/problem/14719
// 10:01 ~ 10:27
//--------------------------------------------//

// 맨 앞에서 제일 높은 곳까지, 맨 뒤에서 제일 높은 곳까지, 중간지점 에서 중간지점

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var height = input[0]
var width = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// 최대 높이
var maxHeight = board.max()!

var answer = 0

// 맨 앞에서 제일 높은 위치 까지
var startAnswer = 0
var startHeight = board[0]
var startMiddleIndex = 0
for index in 0..<board.count {
    if startHeight > board[index] {
        startAnswer += (startHeight - board[index])
    } else if startHeight <= board[index] {
        if board[index] == maxHeight {
            startMiddleIndex = index
            break
        }
        startHeight = board[index]
    }
}

// 뒤에서 제일 높은 위치까지
var endAnswer = 0
var endHeight = board[width - 1]
var endMiddleIndex = 0
for index in (0..<board.count).reversed() {
    if endHeight > board[index] {
        endAnswer += (endHeight - board[index])
    } else if endHeight <= board[index] {
        if board[index] == maxHeight {
            endMiddleIndex = index
            break
        }
        endHeight = board[index]
    }
}

// 중간 ~ 중간 (제일 높은 지점 사이의 빗물)
for index in startMiddleIndex..<endMiddleIndex+1 {
    answer += (board[startMiddleIndex] - board[index])
}

// Output
answer = answer + endAnswer + startAnswer
print(answer)
