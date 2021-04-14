import Foundation
print("Welcome back to the UW Calculator")

// Your job is to fill out Calculator so all the expressions
// below both compile and return "true"
class Calculator {
    
    // goes through the array of ints and adds them all together.
    func add(_ values:  [Int]) -> Int {
        var newNum = 0
        for num in values {
            newNum += num
        }
        return newNum
    }
    
    // adds values from lhs and rhs and returns the final value.
    func add(lhs l: Int, rhs r: Int) -> Int {
        return l + r
    }
    
    // goes through each dictionary and returns the values added together.
    func add(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! + rhs["x"]!, "y": lhs["y"]! + rhs["y"]!]
    }
    
    // goes through esach value in lhs and rhs and returns them added all together.
    func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    
    // goes through the array of ints and subtracts them all together to return a final value.
    func subtract(_ values:  [Int]) -> Int {
        var newNum = 0
        for num in values {
            newNum -= num
        }
        return newNum
    }
    
    // subtracts values from lhs and rhs and returns the final value.
    func subtract(lhs l: Int, rhs r: Int) -> Int {
        return l - r
    }
    
    // goes through each dictionary and returns the values subtracted together.
    func subtract(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! - rhs["x"]!, "y": lhs["y"]! - rhs["y"]!]
    }
    
    // goes through esach value in lhs and rhs and returns them subtracted all together.
    func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    
    // multiplies values from lhs and rhs and returns the final value.
    func multiply(lhs l: Int, rhs r: Int) -> Int {
        return l * r
    }
    
    // goes through the array of ints and multiplies them all together to return a final value.
    func multiply(_ values:  [Int]) -> Int {
        var newNum = 1
        for num in values {
            newNum *= num
        }
        return newNum
    }
    
    // divides values from lhs and rhs and returns the final value.
    func divide(lhs l: Int, rhs r: Int) -> Int {
        return l / r
    }
    
    // goes through each value and records a count. Returns this value.
    func count(_ values:  [Int]) -> Int {
        var newNum = 0
        for num in values {
            newNum+=1
        }
        return newNum
    }
    
    // goes through each value and records a count and value then divides them. Returns this value.
    func avg(_ values:  [Int]) -> Int {
        var count = 0
        var newNum = 1
        for num in values {
            newNum+=num
            count+=1
        }
        if count == 0 {
            newNum = 0
        } else {
            newNum = newNum / count
        }
        return newNum
    }
    
    // Performs a math op and then returns this final value
    func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    // goes through each value in the array and then does the op on the value. Returns this value.
    func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        var newNum = beg
        for n in args {
            newNum = op(newNum, n)
        }
        return newNum
    }
}

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====


// ====> Do not modify code in this section <====
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
