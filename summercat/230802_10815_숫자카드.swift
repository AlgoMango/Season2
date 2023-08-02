// 걸린시간: 10분 미만

let n = Int(readLine()!)!
let sanggeun = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var dict: [Int: Bool] = [:]
var answer: String = ""

for number in sanggeun {
    dict[number] = true
}

for number in numbers {
    if dict[number] != nil { answer += "1 " }
    else { answer += "0 " }
}

answer.removeLast()
print(answer)
