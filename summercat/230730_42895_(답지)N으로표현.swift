func solution(_ N:Int, _ number:Int) -> Int {
    if N == number { return 1 }
    
    var base: Int = N
    var dp: [[Int]] = Array(repeating: [Int](), count: 9)
    dp[1].append(N)
    
    for i in 2..<9 {
        base = base * 10 + N
        dp[i].append(base)
        
        for j in 1..<i {
            for x in dp[j] {
                if x == 0 { continue }
                for y in dp [i - j] {
                    if y == 0 { continue }
                    dp[i].append(x + y)
                    dp[i].append(x - y)
                    dp[i].append(x * y)
                    dp[i].append(x / y)
                }
            }
        }
        
        for cur in dp[i] {
            if cur == number { return i }
        }
    }

    return -1
}
