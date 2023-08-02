import Foundation

// 00: 37 ~ 00: 50

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let M = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int($0)! }

var results: [String] = []

func binarySearch(target: Int) -> String {
    var start = 0
    var end = numbers.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if numbers[mid] < target {
            start = mid + 1
        } else if numbers[mid] > target {
            end = mid - 1
        } else {
            return "1"
        }
    }
    
    return "0"
}

targets.forEach {
    results.append(binarySearch(target: $0))
}

print(results.joined(separator: " "))
