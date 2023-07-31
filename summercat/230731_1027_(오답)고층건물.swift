// 자료형 문제? 범위 문제?
// 내일 다시 풀어봄

var n = Int(readLine()!)!
let buildings: [Double] = readLine()!.split(separator: " ").compactMap { Double(String($0)) }
var answer: Int = 0
var answers: [Int] = []

for i in 0..<n {
    if buildings[i] == 1 { continue }
    var curAnswer: Int = 0
    
    // i에서 j로 (왼쪽)
    for j in 0..<i {
        if buildings[j] > buildings[i] { continue }
        
        let dist: Double = Double(i - j)
        let gap: Double = buildings[i] - buildings[j]
        var flag: Bool = true
                
        // j와 i 사이에 있는 기둥
        for k in (j + 1)..<i {
            if buildings[i] < buildings[k] {
                flag = false
                continue
            }
            
            let curHeight = buildings[j] + gap / dist * Double(k - j)
            if buildings[k] >= curHeight { flag = false }
        }
        
        if flag { curAnswer += 1 }
    }
    
    // i에서 j로 (오른쪽)
    for j in (i + 1)..<n {
        if buildings[j] > buildings[i] { continue }

        let dist: Double = Double(j - i)
        let gap: Double = buildings[i] - buildings[j]
        var flag: Bool = true
        
        // i와 j 사이에 있는 기둥
        for k in (i + 1)..<j {
            if buildings[i] < buildings[k] {
                flag = false
                continue
            }
            
            let curHeight = buildings[j] + gap / dist * Double(j - k)
            if buildings[k] >= curHeight { flag = false }
        }
        
        if flag { curAnswer += 1 }
    }
    
    answer = answer > curAnswer ? answer : curAnswer
}

print(answer)
