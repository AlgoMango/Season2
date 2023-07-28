import Foundation
// 1시간 풀음
// 2, -1, 1 순서 맞추니까 통과 어거지로 맞춘 것 같음,,,

let info = readLine()!.split(separator: " ").map { Int($0)! }
let subin = info[0]
let brother = info[1]

if subin == brother {
    print(0)
    exit(0)
}

var visits: [Int] = Array(repeating: 0, count: 100001)
var timeGraph: [Int] = Array(repeating: 0, count: 100001)

var isFind: Bool = false

let superPower = [2, -1, 1]

var needVisitsQueue: [Int] = [subin]
visits[subin] = 1
var index = 0

while !isFind {
    let currentQueue = needVisitsQueue[index]
    index += 1
    
    for move in superPower {
        var movePosition = 0
        
        if move == 2 {
            movePosition = currentQueue * move
        } else {
            movePosition = currentQueue + move
        }
        
        guard (0...100000) ~= movePosition else {
            continue
        }
        
        guard visits[movePosition] != 1 else {
            continue
        }
        
        if move == 2 {
            timeGraph[movePosition] = timeGraph[currentQueue]
        } else {
            timeGraph[movePosition] += timeGraph[currentQueue] + 1
        }
        
        if movePosition == brother {
            isFind = true
            break
        } else {
            needVisitsQueue.append(movePosition)
            visits[movePosition] = 1
        }
    }
}

print(timeGraph[brother])
