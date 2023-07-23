import Foundation

// 01: 00 ~ 01: 56

func solution(_ a:[Int]) -> Int {
    let min = a.min()!
    var result = 0
    
    var frontMinValue = a.first!
    var backMinValue = a.last!
    
    for value in a {
        if value == min {
            break
        }
        
        if value <= frontMinValue {
            result += 1
            frontMinValue = value
        }
        
    }
    
    for value in a.reversed() {
        if value == min {
            break
        }
        
        if value <= backMinValue {
            result += 1
            backMinValue = value
        }
    }
    
    return result + 1
}

