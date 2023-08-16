// 이진탐색 연습

func solution() {
    let _ = Int(readLine()!)!
    let targets = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
    let _ = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    
    func binary(_ array: [Int], target: Int) { // while 대신 재귀를 이용한 방법도 가능
        var start = 0
        var end = array.count - 1
        
        while start <= end {
            let mid = (start + end) / 2
            
            if targets[mid] < target {
                start = mid + 1
            } else if targets[mid] > target {
                end = mid - 1
            } else {
                print(1)
                return
            }
        }
        print(0)
    }
    
    array.forEach {
        binary(targets, target: $0)
    }
}

solution()
