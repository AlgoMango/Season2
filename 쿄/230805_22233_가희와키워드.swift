// 230805_22233_가희와키워드
// https://www.acmicpc.net/problem/22233
// 15:42
//--------------------------------------------//
// 왜 시간초과..

// 메모장에 쓴 키워드는 모두 서로 다르며, 총 N개다.
// 새 글 작성시, 최대 10개 키워드에 대한 글을 쓴다.
// 글쓴이후 메모장에서 키워드가 사라진다.

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var total = input[0]
var essay = input[1]

var dict: [String: Bool] = [:]

for _ in 0..<total {
    let text = readLine()!
    dict[text] = true
}

var count = total
for _ in 0..<essay {
    let texts = readLine()!.split(separator: ",").map { String($0) }
    
    for text in texts {
        if dict[text] != nil {
            if dict[text] == true {
                dict[text] = false
                count -= 1
            }
        }
    }
    
    print(count)
}
// ---------------------------------------------------------------------//
// Python3
firstInput = input().split(" ")

total = int(firstInput[0])
essay = int(firstInput[1])
textDict = {}

for index in range(total):
    text = input()
    textDict[text] = True

count = total
for index in range(essay):
    textInput = input().split(",")
    for text in textInput:
        if text in textDict.keys():
            if textDict[text] == True:
                textDict[text] = False
                count = count - 1    
    print(count)
