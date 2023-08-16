// 4:38~5:40
// 문제는 지름길인데 내 풀이는 지름길이 아닌,,

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let count = input[0], totalDistance = input[1]
    var shortcuts: [(start: Int, end: Int, distance: Int)] = []
    var distance: [Int] = []
    
    for i in 0...totalDistance { distance.append(i) }
    
    for _ in 1...count {
        let shortcut = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        let start = shortcut[0], end = shortcut[1], distance = shortcut[2]
        
        guard end <= totalDistance else { continue }
        
        shortcuts.append((start, end, distance))
    }
    
    for index in 0..<distance.count {
        if index > 0 {
            distance[index] = min(distance[index-1]+1, distance[index])
        }
        
        for i in 0..<shortcuts.count {
            let current = shortcuts[i]
            
            if current.start == index, distance[current.end] > current.start + current.distance {
                distance[current.end] = distance[index] + current.distance
            }
        }
    }
    
    print(distance.last!)
}

solution()
