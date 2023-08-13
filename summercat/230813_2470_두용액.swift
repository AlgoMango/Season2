// 두 용액 30분

let n = Int(readLine()!)!
var liquids: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

liquids.sort(by: <)

// 두 개만 합쳐서 0에 가장 가깝게
// 출력: 합친 두 개를 오름차순으로 출력
// liquids: 100_000개 이하

// 두 개의 합이 0에 가장 가까운 조합
// 완탐하면 100_000 C 2 = 100_000 * 99_999 / 2 = 4_999_950_000 40억 > 완탐 X

var answer: String = ""

func solve() {
    var left: Int = 0
    var right: Int = liquids.count - 1
    var min: Int = 2_000_000_000
    
    while left < right {
        let sum = liquids[left] + liquids[right]
        
        if abs(sum) < abs(min) {
            min = sum
            answer = "\(liquids[left]) \(liquids[right])"
        }
        
        // 합이 0이면 조기 종료
        if sum == 0 { break }
        // 좁혀가는 조건
        // -10 -5 3 8 20 23
        // -10 23 = 13
        // -10 20 = 10
        // -10 8 = 2
        
        if sum < 0 { // left를 옮기는 경우
            left += 1
        } else { // right를 옮기는 경우
            right -= 1
        }
    }
}

solve()
print(answer)
