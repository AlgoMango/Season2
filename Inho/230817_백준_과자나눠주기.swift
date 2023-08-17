//조카 울음잔치,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let count = input[0]
    let totalNumbers = numbers.reduce(0) { $0 + $1 }
    var stack: [Int] = []
    
    guard count < totalNumbers else {
        print(0)
        return
    }
    
    if numbers.count >= count {
        var start = 0
        var end = numbers.count - 1
        let target = numbers.count - count
        
        while start < end {
            let mid = (start + end) / 2
            
            if target > mid {
                start = mid + 1
            } else if target < mid {
                end = mid - 1
            } else {
                start = mid
                break
            }
        }
        print(numbers[start])
    } else {
        while numbers.count + stack.count < count {
            
            if stack.isEmpty {
                let largest = numbers.removeLast()
                stack.append(largest / 2)
                stack.append(largest / 2)
            } else {
                let max1 = numbers.last!, max2 = stack.first!
                
                if max1 >= max2 {
                    let largest = numbers.removeLast()
                    stack.append(largest / 2)
                    stack.append(largest / 2)
                } else {
                    let largest = stack.removeFirst()
                    stack.append(largest / 2)
                    stack.append(largest / 2)
                }
            }
        }
        
        print(stack.last!)
    }
}

solution()
