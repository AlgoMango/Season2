//12:30~1:20, 포기,, 구글링 해씀다

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let map = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var leftMax = [Int](repeating: 0, count: map.count)
    var rightMax = [Int](repeating: 0, count: map.count)
    
    leftMax[0] = map[0]
    rightMax[rightMax.count-1] = map.last!

    for i in 1..<map.count {
        leftMax[i] = max(leftMax[i-1], map[i]) //현재 인덱스 기준 왼쪽 최댓값
    }

    for i in (0..<map.count-1).reversed() {
        rightMax[i] = max(rightMax[i+1], map[i]) //현재 인덱스 기준 오른쪽 최댓값
    }
    
    var result = 0
    for i in 0..<map.count {
        result += min(leftMax[i], rightMax[i]) - map[i] //현재 인덱스에서 좌우 최댓값 중 작은값과 자신 값 차이만큼 빗물
    }
    
    print(result)
}

solution()
