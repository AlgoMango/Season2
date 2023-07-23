//시간초과 지옥,,,

func solution(_ a:[Int]) -> Int {
    var result: [Int] = []
    
    func bfs(_ array: [Int], hasChance: Bool) {
        if array.count == 1 {
            if !result.contains(array.first!) {
                result.append(array.first!)
            }
            return
        }
        
        for i in 0..<array.count - 1 {
            var nextArray = array
            
            if hasChance {
                let minimum = min(nextArray[i], nextArray[i+1])
                let maximum = max(nextArray[i], nextArray[i+1])
                
                nextArray.remove(at: nextArray.firstIndex(of: minimum)!)
                bfs(nextArray, hasChance: false)
                nextArray.insert(minimum, at: index)
                nextArray.remove(at: nextArray.firstIndex(of: maximum)!)
                bfs(nextArray, hasChance: true)
            } else {
                let maximum = max(nextArray[i], nextArray[i+1])
                nextArray.remove(at: nextArray.firstIndex(of: maximum)!)
                bfs(nextArray, hasChance: false)
            }
        }
    }
    
    bfs(a, hasChance: true)
    
    return result.count
}
