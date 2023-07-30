import Foundation

// 00: 00 ~ 01: 00
// 넘나 어렵네유,,,

func solution(_ N:Int, _ number:Int) -> Int {
    guard N != number else {
        return 1
    }

    var result = -1

    func dfs(current: Int, count: Int) {
        if count > 8 {
            return
        }

        if current == number {
            if count < result || result == -1 {
                result = count
            }
        }

        var temp = 0

        for i in 0..<8 {
            if result != -1 && result < count + 1 + i {
                break
            }

            temp = temp * 10 + N
            dfs(current: current + temp, count: count + 1 + i)
            dfs(current: current - temp, count: count + 1 + i)
            dfs(current: current / temp, count: count + 1 + i)
            dfs(current: current * temp, count: count + 1 + i)
        }

    }

    dfs(current: 0, count: 0)
    return result
}
