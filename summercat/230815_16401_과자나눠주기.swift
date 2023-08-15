// 탐색 범위, mid 값 결정에 신경써야 한다
// mid = (left + right) / 2 로 하면 mid = 0인 경우 때문에 안됨!

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let sticks: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var m: Int = input[0]
var n: Int = input[1]

// 길이: target
// target 이상 과자가 m개 이상이어야 한다.
// 쪼갤 수 있다 -> 15를 7 7 로 나누어서 2명에게 주기 가능

func solve(){
    var left: Int = 0
    var right: Int = sticks.max()!
    
    while left < right {
        let mid = (left + right + 1) / 2
        var count: Int = 0
        
        for i in 0..<n {
            count += sticks[i] / mid
        }
        
        if count >= m { left = mid }
        else { right = mid - 1 }
    }

    print(left)
}

solve()
