import Foundation
// 시작시간 11:48
// 로직이 왜 틀렸는지 도저히 이해가 안돼요???????

// n개의 풍선, 1개만 남을 때까지 터트린다
// 임의의 인접한 2개를 고르고 하나를 터트림

// 번호가 더 작은 쪽은 딱 한 번만 선택 가능 > 이후로는 번호가 큰 것만
// 마지막까지 남을 수 있는 풍선 종류의 개수

// 개수 >= 1_000_000
// 시간복잡도 n^2 미만으로 풀어야 함
// 중복 숫자 없음

func solution(_ a:[Int]) -> Int {
    var min: Int = 1_000_000_001
    var answer: Int = a.count
    var temp: [Int] = []

    for i in 0..<a.count {
        let cur = a[i]
        
        // 현재 인덱스가 최소인 경우
        if cur < min { 
            min = cur // 최소 갱신
            continue
        }
        
        // 현재 인덱스보다 앞에 작은 수가 존재하는 경우 오른쪽에 자신보다 큰 수만 와야 함
        
        // temp가 비어있으면 추가하고 끝
        if temp.isEmpty { 
            temp.append(cur)
            continue
        }
        
        // temp에 수가 존재하는 경우
        
        // temp에 있는 모든 수보다 작은 수가 들어온 경우
        if cur < temp[0] { 
            answer -= temp.count // temp 배열 개수만큼 답에서 빼기
            temp = [cur] // temp 배열 전체를 비우고, cur만 집어넣는다
            continue
        }
        
        // temp의 가장 마지막 원소(가장 큰 수)부터 비교하면서
        // 자신보다 큰 값은 지운다
        var idx: Int = temp.count - 1 // 가장 마지막 원소
        while true {
            // 종료조건: temp가 빈 경우 또는 temp[idx]가 cur보다 작은 경우
            if temp.isEmpty || temp[idx] < cur {
                temp.append(cur)
                break
            }
            temp.removeLast()
            idx -= 1
            answer -= 1
        }
    }
    
    return answer
}
