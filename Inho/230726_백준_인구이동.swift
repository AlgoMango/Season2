//50분 

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let number = input[0], min = input[1], max = input[2]
    var graph: [[Int]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: number), count: number)
    var temp: [[(Int, Int)]] = []
    let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]
    var count = 0
    
    for _ in 1...number {
        let row = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        graph.append(row)
    }
    
    func bfs(from node: (Int, Int)) {
        guard !visited[node.1][node.0] else { return }
        
        var queue: [(Int, Int)] = [node]
        var index = 0
        visited[node.1][node.0] = true
 
        while index < queue.count {
            let current = queue[index]

            for i in 0...3 {
                let next = (current.0 + dx[i], current.1 + dy[i])
                
                guard (0..<number).contains(next.0), (0..<number).contains(next.1),
                      !visited[next.1][next.0]
                else {
                    continue
                }
                
                if (min...max).contains(abs(graph[next.1][next.0] - graph[current.1][current.0])) {
                    visited[next.1][next.0] = true
                    queue.append((next.0, next.1))
                }
            }
            index += 1
        }
        
        if queue.count != 1 {
            temp.append(queue)
            queue.removeAll()
        }
    }
    
    while true {
        for i in 0..<number {
            for j in 0..<number {
                bfs(from: (i, j))
            }
        }
        
        if !temp.isEmpty {
            temp.forEach({
                let count = $0.count
                let totalPeople = $0.reduce(0) { $0 + graph[$1.1][$1.0] }
                let result = totalPeople / count
                
                $0.forEach {
                    graph[$0.1][$0.0] = result
                }
            })
            count += 1
            temp.removeAll()
            visited = Array(repeating: Array(repeating: false, count: number), count: number)
        } else {
            break
        }
    }
    
    print(count)
}

solution()
