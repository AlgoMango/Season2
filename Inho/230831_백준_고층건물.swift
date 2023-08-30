// 12:23 ~ 1:40 풀고보니까 할만했는데 초반에 왤케 오래걸렸지,,
/*
maxA = -999999999로 했더니
2
1000000000 1 -> 1나와야 하는데 0나오는거때메 삽질쓰
*/

func solution() {
    let count = Int(readLine()!)!
    let buildings = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var results = Array(repeating: 0, count: count)
    // y = ax + b
    for i in 0..<count {
        var maxA: Double = -1000000000 
        
        for j in i+1..<count {
            let a = Double(buildings[i] - buildings[j]) / Double(i - j)
            
            if a > maxA {
                maxA = a
                results[i] += 1
                results[j] += 1
            }
        }
    }
    print(results.max()!)
}

solution()
