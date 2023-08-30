// 12번 시도끝에 포기,,,, 테케 다 되는데 어디서 틀리는지 모르겠습니다,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
    let count = input[0]
    
    func snack(_ length: Int) -> Int {
        var result = 0
        
        for i in 0..<numbers.count {
            result += (numbers[i] / length)
        }
        
        return result
    }
    
    var start = 1, end = numbers.last!
    
    while start <= end {
        let mid = (start + end) / 2
        let max = snack(mid)
        
        if max < count {
            end = mid - 1
        } else if max >= count {
            start = mid + 1
        }
    }
    
    print(end)
}
