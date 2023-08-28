// 투포인터 3:53 ~ 4:30

func solution() {
    let count = Int(readLine()!)!
    let liquids = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
    var min: Int = 2000000000
    var result: (Int, Int) = (0,0)
    var start = 0, end = count - 1

    while start < end {
        let current = abs(liquids[start] + liquids[end])
        
        guard current != 0 else {
            result = (start, end)
            break
        }
        
        if current < min {
            min = current
            result = (start, end)
        }
        
        if liquids[start] + liquids[end] > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
    
    print(liquids[result.0], liquids[result.1], separator: " ")
}

solution()
