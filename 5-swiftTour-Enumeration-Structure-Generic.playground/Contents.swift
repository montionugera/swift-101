//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*Enumerations and Structures

Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
*/

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    static let allValues = [Ace,Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten,Jack, Queen, King]
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

let nine = Rank.Nine
nine.rawValue
nine.simpleDescription()
let jack = Rank.Jack
jack.rawValue
jack.simpleDescription()

//EXPERIMENT
//
//Write a function that compares two Rank values by comparing their raw values.
//
func compare(a:Rank , b: Rank) -> Bool{
    return a.rawValue == b.rawValue
}

//In the example above, the raw-value type of the enumeration is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the rawValue property to access the raw value of an enumeration member.
//
//Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
//The member values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    static let allValues = [Spades,Hearts,Diamonds,Clubs]
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
//EXPERIMENT
//
//Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//
extension Suit{
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        default:
            return "red"
        }
    }
}

//Notice the two ways that the Hearts member of the enumeration is referred to above: When assigning a value to the hearts constant, the enumeration member Suit.Hearts is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration member is referred to by the abbreviated form .Hearts because the value of self is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.



//
//Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//EXPERIMENT
//
//Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
for a in 0...1{
    print(a)
}
extension Card{
    static func createFullDeck()->[Card]{
        var cardDeck = [Card]()
        for suit in Suit.allValues{
            for rank in Rank.allValues{
                cardDeck.append(Card(rank:rank, suit: suit))
            }
        }
        return cardDeck
    }
}

let fullDeck = Card.createFullDeck()
fullDeck.count

//
//An instance of an enumeration member can have values associated with the instance. Instances of the same enumeration member can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration member is the same for all of its instances, and you provide the raw value when you define the enumeration.

//
//For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}

//EXPERIMENT
//
//Add a third case to ServerResponse and to the switch.
//
//Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.
//
//Protocols and Extensions
//
//Use protocol to declare a protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
//Classes, enumerations, and structs can all adopt protocols.

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//EXPERIMENT
//
//Write an enumeration that conforms to this protocol.
//

enum ExampleEnum : ExampleProtocol{
    case Base,Adjust
    var simpleDescription: String { get {
        return self.getDescription()
        }
    }
    
    func getDescription() -> String{
        switch self{
        case .Base:
            return "A simple description of apple"
        case .Adjust:
            return "Adjusted description of beadjusted"
        default:
            return "default description"
        }
    }
    
    mutating func adjust() {
        self = ExampleEnum.Adjust
    }
}

var c = ExampleEnum.Base
c.adjust()
let cDescription = c.simpleDescription

//Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.

//Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    var abss: Int{
        return abs(self)
    }
}
println(7.simpleDescription)
var abs17 = (-17).abss
println(abs17)

//xx.absoluteValue

//EXPERIMENT
//
//Write an extension for the Double type that adds an absoluteValue property.

var xx = Double(-0.1)

extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}
xx.absoluteValue

//xd1

//xd.absoluteValue
//
//You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.

let protocolValue: ExampleProtocol = a

println(protocolValue.simpleDescription)


// println(protocolValue.anotherProperty)  // Uncomment to see the error


//Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.

//
//Generics
//


//Write a name inside angle brackets to make a generic function or type.

func repeat<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    return result
}

repeat("knock", 4)

//You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
//Use where after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])
//EXPERIMENT
//
//Modify the anyCommonElements function to make a function that returns an array of the elements that any two sequences have in common.
//
//In the simple cases, you can omit where and simply write the protocol or class name after a colon. Writing <T: Equatable> is the same as writing <T where T: Equatable>.


