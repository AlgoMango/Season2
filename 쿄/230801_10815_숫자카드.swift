// 230801_10815_숫자카드
// https://www.acmicpc.net/problem/10815
// 12:50 ~ 12:56
//--------------------------------------------//
let number = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let fountNumber = Int(readLine()!)!
let foundinput = readLine()!.split(separator: " ").map { Int(String($0))! }

var dict: [Int: Bool] = [:]

for item in input {
    dict[item] = true
}

var answer: [Int] = []

for item in foundinput {
    if dict[item] != nil {
        answer.append(1)
    } else {
        answer.append(0)
    }
}

print(answer.map { String($0) }.joined(separator: " "))
