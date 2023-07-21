import Foundation

// 15: 04 ~ 15: 44

let info = readLine()!.split(separator: " ").map { Int($0)! }
let height = info[0]
let width = info[1]

let blockHeights: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var maxHeight = 0
var maxIndex = 0
var temp = 0
var result = 0

func 빗물계산하기(높이들: [Int]) {
    for (index, height) in 높이들.enumerated() {
        if height >= maxHeight {
            result += temp
            maxIndex = index
            maxHeight = height
            temp = 0
        } else {
            temp += maxHeight - height
        }
    }
}

빗물계산하기(높이들: blockHeights)

if temp != 0 {
    let tempHeights: [Int] = Array(blockHeights[maxIndex..<blockHeights.count]).reversed()
    maxIndex = 0
    maxHeight = 0
    temp = 0
    
    빗물계산하기(높이들: tempHeights)
}

print(result)
