import Foundation

let count = Int(readLine()!)!

let liquids = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var resultLiquids: (Int, Int) = (0, 0)
var maxLiquid: Int = 2000000000

var start: Int = 0
var end: Int = liquids.count - 1

while start < end {
    let sum = liquids[start] + liquids[end]
    
    if abs(sum) < maxLiquid {
        maxLiquid = abs(sum)
        resultLiquids = (liquids[start], liquids[end])
    }
    
    if sum < 0 {
        start += 1
    } else {
        end -= 1
    }
}

print(resultLiquids.0, resultLiquids.1)

// 조합이네 개꿀하고 풀었는데 메모리 초과남
let count = Int(readLine()!)!

let liquids = readLine()!.split(separator: " ").map { Int($0)! }
var sumLiquids: [(Int, Int)] = []

func makeCombination(start: Int, arr: [Int]) {
    if arr.count == 2 {
        sumLiquids.append((arr[0], arr[1]))
        return
    }
    
    var copyArr = arr
    
    for index in (start + 1)..<liquids.count {
        copyArr.append(liquids[index])
        makeCombination(start: start + 1, arr: copyArr)
        copyArr.popLast()
    }
}

makeCombination(start: -1, arr: [])

print(sumLiquids)

var minLiquidCombination = (0, 0)
var minLiquid: Int64 = 200000000

sumLiquids.forEach {
    let sum = abs($0.0 + $0.1)
    
    if sum < minLiquid {
        minLiquid = Int64(sum)
        minLiquidCombination = $0.0 < $0.1 ? ($0.0, $0.1) : ($0.1, $0.0)
    }
}

print(minLiquidCombination.0, minLiquidCombination.1)
