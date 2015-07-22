//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Control Flow
//Use if and switch to make conditionals, and use for-in, for, while, and do-while to make loops. Parentheses around the condition or loop variable are optional. 
//Braces around the body are required.

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore
//In an if statement, the conditional must be a Boolean expression—this means that code such as if score { ... } is an error, not an implicit comparison to zero.

//You can use if and let together to work with values that might be missing. These values are represented as optionals. 
//An optional value either contains a value or contains nil to indicate that the value is missing.

//Write a question mark (?) after the type of a value to mark the value as optional.”

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//“EXPERIMENT
//
//Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.”
//
optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
}


//“If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.
//
//Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.”

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}


//“EXPERIMENT
//
//Try removing the default case. What error do you get?”
//
//Advance Case

let level = 88
switch level {
case 0...60:
    let status = "class A."
case 60...99:
    let status = "class B."
default:
    let status = "class C."
}


//“You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

largest
//EXPERIMENT
//
//Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
//
//Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m
//You can keep an index in a loop—either by using .. to make a range of indexes or by writing an explicit initialization, condition, and increment. These two loops do the same thing:”
//


var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop
//use ... to make a range that includes both values.”

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    println("Person \(i + 1) is called \(names[i])")
}
