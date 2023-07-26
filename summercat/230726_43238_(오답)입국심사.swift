// 시작시간 15:45
// 완전탐색 시 100_000 * 1_000_000_000 = 100_000_000_000_000
// 보통 백만의 제곱까지는 시간복잡도가 괜찮다고 알고있었는데..?

import Foundation

// times <= 100_000
func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var answer: Int64 = 0
    
    var desks: [Int64] = Array(repeating: 0, count: times.count)
    
    for i in 0..<n {
        var min: Int64 = Int64.max
        var minIdx: Int = 0
        for j in 0..<desks.count {
            if desks[j] + Int64(times[j]) < min {
                min = desks[j] + Int64(times[j])
                minIdx = j
            }
        }
        
        desks[minIdx] += Int64(times[minIdx])
    }
    
    answer = desks.max()!
    return answer
}
