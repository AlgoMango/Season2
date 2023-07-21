// 25분

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let row: Int = input[0]
let col: Int = input[1]

var blocks: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var maxHeight: Int = 0
var maxIndices: [Int] = []
var answer: Int = 0

for i in 0..<col {
    if blocks[i] > maxHeight {
        maxHeight = blocks[i]
        maxIndices = [i]
    } else if blocks[i] == maxHeight {
        maxIndices.append(i)
    }
}

func solve() {
    if maxIndices.count == 1 {
        fromLeft(to: maxIndices[0])
        fromRight(to: maxIndices[0])
    } else {
        let maxCount = maxIndices.count
        fromLeft(to: maxIndices[0])
        fromRight(to: maxIndices[maxCount - 1])
        addBetween(from: maxIndices[0], to: maxIndices[maxCount - 1])
    }
    
    print(answer)
}

func fromLeft(to idx: Int) {
    var left: Int = blocks[0]
    if left == maxHeight { return }
    
    for i in 0..<idx {
        if blocks[i] >= left {
            left = blocks[i]
            continue
        } else {
            answer += left - blocks[i]
        }
    }
}

func fromRight(to idx: Int) {
    var right: Int = blocks[col - 1]
    if right == maxHeight { return }
    
    for i in (idx..<col).reversed() {
        if blocks[i] >= right {
            right = blocks[i]
            continue
        } else {
            answer += right - blocks[i]
        }
    }
}

func addBetween(from: Int, to: Int) {
    for i in from...to {
        if blocks[i] < maxHeight {
            answer += maxHeight - blocks[i]
        }
    }
}

solve()
