import Foundation
// 12:00 ~ 12:40

let info = readLine()!.split(separator: " ").map { Int($0)! }

let N = info[0]

// L 이상 R 이하
let L = info[1]
let R = info[2]

let dr = [1, 0, -1, 0]
let dc = [0, 1, 0, -1]

var A: [[Int]] = []
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
var openCountry: [(row: Int, column: Int)] = []

var result = 0

for _ in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    A.append(input)
}

func bfs(start: (Int, Int)) {
    var needVisitQueue: [(row: Int, column: Int)] = [start]
    var index = 0
    
    while index < needVisitQueue.count {
        let currentQueue = needVisitQueue[index]
        index += 1
        
        for (dr, dc) in zip(dr, dc) {
            let xPosition = currentQueue.row + dr
            let yPosition = currentQueue.column + dc
            
            guard (0..<N) ~= xPosition && (0..<N) ~= yPosition else {
                continue
            }
            
            guard visits[xPosition][yPosition] == 0 else {
                continue
            }
            
            let current인구 = A[currentQueue.row][currentQueue.column]
            let next인구 = A[xPosition][yPosition]
            
            guard (L...R) ~= abs(current인구 - next인구) else {
                continue
            }
            
            needVisitQueue.append((xPosition, yPosition))
            visits[xPosition][yPosition] = 1
            
            openCountry.append((xPosition, yPosition))
        }
    }
}

var is인구이동일어났냐: Bool = false

func 인구이동() {
    var 인구총합 = 0
    
    for point in openCountry {
        인구총합 += A[point.row][point.column]
    }
    
    let 바뀔인구 = Int(floor(Double(인구총합) / Double(openCountry.count)))
    
    for point in openCountry {
        A[point.row][point.column] = 바뀔인구
    }
}

while true {
    for row in 0..<N {
        for column in 0..<N {
            if visits[row][column] == 0 {
                visits[row][column] = 1
                
                openCountry = [(row, column)]
                bfs(start: (row, column))
                인구이동()
                
                if openCountry.count > 1 {
                    is인구이동일어났냐 = true
                }
                
            }
        }
    }
    
    if is인구이동일어났냐 == false {
        break
    }
    
    result += 1
    visits = Array(repeating: Array(repeating: 0, count: N), count: N)
    is인구이동일어났냐 = false
}

print(result)
