//30분

func solution() {
    let _ = Int(readLine()!)!
    var myCards = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let count = Int(readLine()!)!
    let totalCards = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var sortedCards: [(Int, Int)] = []
    var result: [Int] = Array(repeating: 0, count: count)
    
    myCards = myCards.sorted { $0 < $1 }
    for i in 0..<count {
        sortedCards.append((i, totalCards[i]))
    }
    sortedCards = sortedCards.sorted { $0.1 < $1.1 }
    
    while !sortedCards.isEmpty {
        let current = sortedCards.last!
        
        if let last = myCards.last {
            if last == current.1 {
                sortedCards.removeLast()
                myCards.removeLast()
                result[current.0] = 1
            } else if last > current.1 {
                myCards.removeLast()
            } else {
                sortedCards.removeLast()
            }
        } else {
            break
        }
    }
    
    result.forEach {
        print($0, terminator: " ")
    }
}

solution()
