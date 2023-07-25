import Foundation

// 시작시간: 14:01
// 삽입에 logn, 제거에 logn
// n번 삽입 -> nlogn
// n번 제거 -> nlogn
// 총 2*nlogn 인데 왜 안될까요...

// Max heap으로 전체를 만든 다음에, n - 1개를 삭제한 친구?

struct Heap<T: Comparable> {
    var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    mutating func shiftUp(child: Int) {
        var child = child
        var parent = parentIndex(of: child)
        
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    mutating func shiftDown(parent: Int) {
        var parent = parent
        
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            
            if left < nodes.count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            
            if right < nodes.count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ data: T) {
        nodes.append(data)
        let lastIndex = nodes.count - 1
        shiftUp(child: lastIndex)
    }
    
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        nodes.swapAt(0, nodes.count - 1)
        
        defer { shiftDown(parent: 0) }
        
        return nodes.removeLast()
    }
    
    private func parentIndex(of child: Int) -> Int {
        return (child - 1) / 2
    }
    
    private func leftChildIndex(of parent: Int) -> Int {
        return (parent * 2) + 1
    }
    
    private func rightChildIndex(of parent: Int) -> Int {
        return parent * 2 + 2
    }
}

// max heap 생성
var heap = Heap<Int>(sort: >)
let n = Int(readLine()!)!

// 입력 받아서 heap 트리 만들기
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    for i in 0..<n {
        heap.insert(line[i])
    }
}

// n번 제거
for i in 0..<n {
    let removed = heap.remove()!
    if i == n - 1 { print(removed) }
}
