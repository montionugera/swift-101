//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//“Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")
//EXPERIMENT
//
//Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
//
func greetLunch(name: String, todays_lunch_special: String = "empty") -> String {
    return "Hello \(name), today’s lunch special is \(todays_lunch_special)."
}
greetLunch("Mont", todays_lunch_special: "Salad")
greetLunch("Mont")


//Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
println(statistics.sum)
println(statistics.2)

//Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//Functions are a first-class type. This means that a function can return another function as its value.

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


//A function can take another function as one of its arguments.

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

//Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//
//EXPERIMENT
//
//Rewrite the closure to return zero for all odd numbers

numbers.map({
    (number: Int) -> Int in
    let result = 0
    if number % 2 == 1 {
        return result
    }
    return number
})

//You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.

let mappedNumbers = numbers.map({ number in 3 * number })
println(mappedNumbers)

//You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses.

let sortedNumbers = sorted(numbers) { $0 > $1 }
println(sortedNumbers)

let sortedNumbers2 = sorted(numbers) { $1 > $0 }
sortedNumbers2
//not recommended
//variadic ! Functions can also take a variable number of arguments, collecting them into an array.”

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

//EXPERIMENT
//
//Write a function that calculates the average of its arguments.

//NOTE
//
//A function may have at most one variadic parameter, and it must always appear last in the parameter list, to avoid ambiguity when calling the function with multiple parameters.
//
//If your function has one or more parameters with a default value, and also has a variadic parameter, place the variadic parameter after all the defaulted parameters at the very end of the list.
//

func avgOf(numbers: Int...) -> Float {
    let sum = Float(numbers.reduce(0, combine: +))
    return sum/Float(numbers.count)
}
avgOf(42, 597, 13)




//A function can take another function as one of its arguments.

func compareDesc(a: Int,b: Int) ->Bool{
    return a > b
}

func sortCustom(list:[Int], compareFunc: (Int,Int)->Bool) -> [Int]{
    var sorted = [Int]()
    var slist = NSMutableArray(array: list)
    while slist.count > 0 {
        var lastWin: Int?
        var selectedIndex = -1
        var idxCount = 0
        for b in slist {
            if let a = lastWin{
                if (compareFunc(b as! Int,a)) {
                    lastWin = b as? Int
                    selectedIndex = idxCount
                }
            }else{
                lastWin = b as? Int
                selectedIndex = idxCount
            }
            idxCount++
        }
        if let a = lastWin{
            sorted.append(a)
            slist.removeObjectAtIndex(selectedIndex)
        }
    }
    return sorted
}
var slist = sortCustom([1,3,5,44,2,-1,2],compareDesc)
print(slist)



