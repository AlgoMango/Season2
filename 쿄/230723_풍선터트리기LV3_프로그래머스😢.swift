// 230723_풍선터트리기LV3_프로그래머스
// 14:05 ~ 14:45
//---------------------------------------//
// 한번은 작은 번호의 풍선을 터트릴 수 있다.
// 그 이후는 번호가 큰 풍선만 터트릴 수 있다.    
// 양쪽의 최솟값이 타겟보다 크거나 1개만 있어야한다(고 생각).
// N^2 통과 안됨..
import Foundation

func solution(_ a:[Int]) -> Int {
    var count = 0
    for index in 0..<a.count {
        if index == 0 || index == a.count - 1 { 
            count += 1 
            continue
        }
        
        var leftA = a[0..<index]
        var rightA = a[index+1..<a.count]
        
        if leftA.min()! < a[index] && rightA.min()! < a[index] { continue }
        count += 1
    }
    
    return count
}
