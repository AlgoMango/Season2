// 개념: https://www.acmicpc.net/board/view/68623
// 풀이: https://www.acmicpc.net/source/share/2e8b21f265ec49eeae1aecbbf73a2db1

var input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n = input[0]
let c = input[1]

var houses: [Int] = []

for _ in 0..<n {
    let number = Int(readLine()!)!
    houses.append(number)
}

houses.sort()

// 이분탐색 적용 방법
// 답이 x 이상일 수 있는가?
// -> 답이 x보다 작은 범위, 큰 범위를 탐색
// 가장 왼쪽 위치부터, 간격이 x 이상이 되도록 공유기를 설치

var start: Int = 0
var end: Int = houses[n - 1] - houses[0]

// 공유기 간격이 최소 dist가 되도록 c개가 설치 가능한지
func check(dist: Int) -> Bool {
    // 첫 번째 집에 무조건 공유기를 설치하기 위함
    // 첫 번째 집에 설치를 해야 최소값이 가장 커질 수 있기 때문
    var prev: Int = -1_000_000_001
    var count: Int = 0
    
    for cur in houses {
        if (cur - prev) >= dist {
            prev = cur
            count += 1
        }
    }
    
    return count >= c
}

while start < end {
    let mid: Int = (start + end + 1) / 2
    
    if check(dist: mid) {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)
