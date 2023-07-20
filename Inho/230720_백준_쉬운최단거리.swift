//쉬운 최단거리 3:40 ~ 4:25
//bfs 오랜만,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let width = input[1], height = input[0]
    let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]
    var graph: [[Int]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
    var target: (Int, Int) = (0,0)
    
    for i in 1...height {
        let row = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
        graph.append(row)
        
        if row.contains(2) {
            let index = row.firstIndex(of: 2)!
            target = (index, i-1)
        }
    }
    
    func bfs() {
        var queue: [(Int, Int)] = [target]
        var index = 0
        
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            for i in 0...3 {
                let next = (node.0 + dx[i], node.1 + dy[i])
                
                guard (0..<width).contains(next.0), (0..<height).contains(next.1),
                      !visited[next.1][next.0]
                else {
                    continue
                }
                
                if graph[next.1][next.0] != 0 {
                    queue.append(next)
                    visited[next.1][next.0] = true
                    graph[next.1][next.0] += graph[node.1][node.0]
                }
            }
        }
    }
    
    graph[target.1][target.0] = 0
    visited[target.1][target.0] = true
    bfs()
    
    for y in 0..<height {
        for x in 0..<width {
            if !visited[y][x], graph[y][x] == 1 {
                graph[y][x] = -1
            }
        }
    }
    
    for y in 0..<height {
        for x in 0..<width {
            print(graph[y][x], terminator: " ")
        }
        print("")
    }
}

solution()
