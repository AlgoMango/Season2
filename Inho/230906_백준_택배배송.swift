// 다익스트라 뭐시기라던데,, 일단 실패,,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (n, m) = (input[0], input[1])
    var array: [(start: Int, end: Int, cows: Int)] = []
    var routes: [Int: [(end: Int, cows: Int)]] = [:]
    var nodes = Array(repeating: 1000, count: n+1)
    nodes[1] = 0
    
    for _ in 0..<m {
        let input2 = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        array.append((min(input2[0], input2[1]), max(input2[0], input2[1]), input2[2]))
    }
    
    for item in array {
        if routes[item.start] == nil {
            routes[item.start] = [(item.end, item.cows)]
        } else {
            routes[item.start]!.append((item.end, item.cows))
        }
    }
    
    func findMin(node: Int, food: Int) {
        guard node < n else { return }
        
        let next = routes[node]!
        
        next.forEach {
            nodes[$0.end] = min(nodes[$0.end], $0.cows + food)
            findMin(node: $0.end, food: $0.cows + food)
        }
    }
    
    findMin(node: 1, food: 0)
    print(nodes.last!)
}

solution()
