// 2470_두용액_0839
// 00:35 ~ 00:46
// 투포인터로 품
//-------------------------------------------//

let totalCount = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var answer: [Int] = [0, 0]

var startIndex = 0
var endIndex = totalCount - 1

var nearByZero = 2000000000

while startIndex < endIndex {
    let target = numbers[endIndex] + numbers[startIndex]
    if nearByZero > abs(target) {
        nearByZero = abs(target)
        answer[0] = numbers[startIndex]
        answer[1] = numbers[endIndex]
    }
    
    if target > 0 {
        endIndex -= 1
    } else {
        startIndex += 1
    }
}

print(answer[0], answer[1])
