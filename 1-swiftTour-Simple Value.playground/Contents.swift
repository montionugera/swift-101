//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1
println("Hello, world")
//You also don’t need to write semicolon

//2
//Simple Values
// **constant **variable
//“Use let to make a constant and var to make a variable.”
var myVariable = 42
myVariable = 50
let myConstant = 42
//infers type
//“the compiler infers that myVariable is an integer because its initial value is a integer”

//2.1 explicit type
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//try ** “Create a constant with an explicit type of Float and a value of 4.”

let explicitFloat: Float = 4


//3 String
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//“Try removing the conversion to String from the last line. What error do you get?”
let widthLabel2 = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//“Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.”
let moneySum = "I have \(1000 + 100.5) bath."
