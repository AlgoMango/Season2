// 투 포인털 7:50 ~ 8:40 
// 투포인터 이번에 살짝 이해했슴다,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (n, k) = (input[0], input[1])
    var start = 0, end = 0
    var visited: [Int: Int] = [:]
    var maxLength = 0
    
    while end < n {
        if visited[numbers[end]] == nil {
            visited[numbers[end]] = 1
            end += 1
        } else {
            if visited[numbers[end]]! < k {
                visited[numbers[end]]! += 1
                end += 1
            } else {
                visited[numbers[start]]! -= 1
                start += 1
            }
        }
        let length = end - start
        maxLength = max(length, maxLength)
    }
    
    print(maxLength)
}

solution()
