// 낮은 곳에서 높은 곳을 보는 것도 포함
// 순간의 높이로 판단하면 안 됨. Double 자료형 특성상 근사값이 나오기 때문
// 기울기로 판단해야 한다

var n = Int(readLine()!)!
let buildings: [Double] = readLine()!.split(separator: " ").compactMap { Double(String($0)) }
var answer: Int = 0

for i in 0..<n {
    var curAnswer: Int = 0

    // i에서 j로 (왼쪽)
    for j in 0..<i {
        let dist: Double = Double(i - j)
        let gap: Double = buildings[j] - buildings[i]
        let slope: Double = gap / dist
        var flag: Bool = true

        // j와 i 사이에 있는 기둥
        for k in (j + 1)..<i {
            let kDist: Double = Double(k - j)
            let kGap: Double = buildings[j] - buildings[k]
            let kSlope: Double = kGap / kDist
            if slope >= kSlope  { flag = false }
        }

        if flag { curAnswer += 1 }
    }

    // i에서 j로 (오른쪽)
    for j in (i + 1)..<n {
        let dist: Double = Double(j - i)
        let gap: Double = buildings[j] - buildings[i]
        let slope: Double = gap / dist
        var flag: Bool = true

        // i와 j 사이에 있는 기둥
        for k in (i + 1)..<j {
            let kDist: Double = Double(j - k)
            let kGap: Double = buildings[j] - buildings[k]
            let kSlope: Double = kGap / kDist
            if slope >= kSlope  { flag = false }
        }

        if flag { curAnswer += 1 }
    }

    answer = answer > curAnswer ? answer : curAnswer
}

print(answer)
