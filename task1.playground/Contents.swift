//: Playground - noun: a place where people can play

import UIKit

//adjust values to test out in this array
var vals: [Int] = [10, 5, 2]

//run LCM function and print result
print("LCM of array given is \(lcmMultiple(vals))")

// greatest common divisor - euclidean algorithm
func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    
    if r != 0 {
        //calculate another set of gcd recursively
        return gcd(b, r)
    } else {
        return b
    }
}

// Returns the least common multiple of two numbers.

func lcm(_ a: Int, _ b: Int) -> Int {
    
    //catch division by 0 error
    if(a==0 || b==0){
        print("error: one of the integers given is 0, can't proceed")
        return 0
    }
    
    //let's use reduction by the greatest common divisor
    return a / gcd(a, b) * b
}

// You can get the LCM of > two numbers by
// iteratively counting up the LCM of two numbers
// eg: lcm(a,b,c) = lcm(a,lcm(b,c))

func lcmMultiple(_ numbers: [Int]) -> Int {
    var result = numbers[0]
    
    for item in numbers {
        result = lcm(result, item)
    }
    
    return result
}
