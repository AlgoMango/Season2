12: 00 ~ 12: 36
import Foundation

let info = readLine()!.split(separator: " ").map { Int($0)! }
let height = info[0]
let width = info[1]

let dr: [Int] = [1, 0, -1, 0]
let dc: [Int] = [0, 1, 0, -1]

var graph: [[Int]] = []
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
var entryPoint: (Int, Int) = (0, 0)

for _ in 1...height {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

func bfs(start: (Int, Int)) {
    var needVisitQueue: [(row: Int, column: Int)] = [start]
    var index: Int = 0
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (row, column) in zip(dr, dc) {
            let checkRow = currentNode.row + row
            let checkColumn = currentNode.column + column
            
            guard (0..<height) ~= checkRow && (0..<width) ~= checkColumn else {
                continue
            }
            
            guard visits[checkRow][checkColumn] == 0 else {
                continue
            }
            
            guard graph[checkRow][checkColumn] != 0 else {
                visits[checkRow][checkColumn] = 1
                continue
            }
            
            needVisitQueue.append((checkRow, checkColumn))
            visits[checkRow][checkColumn] = 1
            graph[checkRow][checkColumn] += graph[currentNode.row][currentNode.column]
        }
    }
}

func printGraph() {
    for line in graph {
        line.forEach {
            print($0, terminator: " ")
        }
        print("")
    }
}

func findMinusOne() {
    for row in 0..<height {
        for column in 0..<width {
            if visits[row][column] == 0 && graph[row][column] != 0 {
                graph[row][column] = -1
            }
        }
    }
}

for row in 0..<height {
    for column in 0..<width {
        if graph[row][column] == 2 {
            graph[row][column] = 0
            visits[row][column] = 1
            bfs(start: (row, column))
            findMinusOne()
            printGraph()
            exit(0)
        }
    }
}
