import Foundation

let N = Int(readLine()!)!

var list: [Int] = []

for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    list += input
}

let sortedList = list.sorted(by: >)

print(sortedList[N - 1])

// 안될꺼 알지만 그냥 해봤는데 당연히 시간초과나고 계속 고민을 해보았지만 모르겠습니다...
