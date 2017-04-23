//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let name = "thomas"

print(str)
print(name)

//return the max number between 2 and 5
print(max(5,2))

//constant declaration
let myConstant = 42

print(myConstant)

//variable declaration
var myVariable = 3

print(myVariable)


//create a constant with float type explicitly
let explicitFloat:Float = 4

print(explicitFloat)

//convert numeric to string
let label = "The width is"
let width = 94
let widthLabel = label + String(width)

//include values in string
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//exercies
let myMoney:Float = 40
let myName = "ziqi"
let word = "I have \(myMoney) yuan."
let greeting = "Hello, \(myName)."


//Arrays and Dictionaries

//1.create array and dictionary

var shoppingList = ["catfish","water","tulips","blue","paint"]

shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",

]

occupations["Jayne"] = "Public Relations"

//2.create an empty array or dictionary

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//Control Flow

let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores{

    if score > 50{
       teamScore += 3
    } else {
       teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"

print(optionalString == nil)

var optionalName: String? = "John Appleseed"

var greeting1 = "hello"

if let name = optionalName {

    greeting1 = "Hello, \(name)"
    
} else if(optionalName == nil){
    
   greeting1 = "Hello World"
}

let nickName:String? = nil
let fullName:String = "John Appleseed"

let informalGreeting = "Hello \(nickName ?? fullName)"

//Switch clause

let vegetable = "red pepper"

switch vegetable {
    
    case "celery":
        
        print("Add some raisins and make ants on a log")
    
    case "cucumber","watercress":
        
        print("That would make a good sandwich.")
    
    case let x where x.hasSuffix("pepper"):
    
        print("Is it a spicy \(x) ?")
    
    default:
        
        print("Everything tastes good in soup")
    

}

//for in clause

let interestingNumbers = [
    
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
]


var largest = 0
//if you want to define a empty string, use "" not ''
var myKind = ""

for(kind,numbers) in interestingNumbers{
    
    for number in numbers {
       
        if number > largest {
        
            largest = number
        }
    
    }
    
    myKind = kind

}

print(myKind,largest)


//while clause

var n = 2

while n < 100 {
 n = n * 2
}

print(n)


//run at least once if the loop condition at the end instead
var m = 2

repeat{
    m = m * 2
} while m < 100

print(m)

//use ..< to make a range of indexes.
var total = 0

for i in 0..<4 {
   
    total += i
}

print(total)


//use ..< to make a range that omits its upper value
//use ...to make a range that includes both values

var sum = 0
for i in 0...4 {
    sum += i
}

print(sum)


//Functions and Closures
func greet(person: String, day: String) -> String {

     return "Hello \(person), today is \(day)."
}

greet(person: "Bob", day: "Tuesday")

print(greet(person: "Bob", day: "Tuesday"))

func greeting(person: String, special: String) -> String {

     return "Hello \(person), today's special is \(special)."
}

print(greeting(person: "Bob", special: "Shrimp"))

//Write a custom argument label before the parameter name.
//write _ to use no argument label.
func greeting_person(_ person: String, on day: String) -> String {

    return "Hello \(person), today is \(day)."
}

print(greeting_person("John", on: "Wednesday"))


//Use a tuple to make a compound value

func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int){

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

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print(statistics.sum)

print(statistics.1)

//Functions can also take a variable number of arguments
//collecting them into an array

func sumOf(numbers: Int...) -> Int {

     var sum = 0
     for number in numbers {
    
       sum += number
    }
    
    return sum
}

sumOf()

sumOf(numbers: 42, 597, 12)


func averageOf(numbers: Int...) -> Int {

     var sum = 0,
         average = 0
    for number in numbers {
        
        sum += number
    }
    if numbers.count > 0  {
        average = sum/numbers.count

    }
    
    return average
}

averageOf(numbers: 42, 597, 12)

//nested function to organize the code in a function that is long or complex

func returnFifteen() -> Int {

   var y = 10
   func add() {
    
      y += 5
   }
    
   add()
   return y

}

returnFifteen()

//Functions are a first-class type.
//A function can return another function as its value
func makeIncrement() -> ((Int) -> Int) {

    func addOne(number: Int) -> Int {
         return 1 + number
    }
    
    return addOne
}

var increment = makeIncrement()

increment(7)



//A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
  
    for item in list {
        
        if condition(item){
           return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {

   return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map({
    (number: Int) -> Int in
    var result:Int
    //let result = 3 * number
    if(number % 2 == 0){
       result = 0
        print(result,number)

    }
    
    return number
})

//writing closures more concisely if the closure's type is already known
let mappedNumbers = numbers.map({ number in 3 * number})

print(mappedNumbers)


let sortedNumbers = numbers.sorted{ $0 > $1 }

print(sortedNumbers)

//Object and Classes

//declare a class
class Shape {

   var numberOfSides = 0
    
   let numberOfAngles = 4
   func simpleDescription() -> String {
    
    return "A shape with \(numberOfSides) sides."
    
   }
    
    func HasAngles(arguments:Int) -> String {
        
    return "A shape has \(arguments) angles."
   }
}

var  shape = Shape()
shape.numberOfSides = 7

var shapeDescription = shape.simpleDescription()

let angles = shape.numberOfAngles

var shapeAngles = shape.HasAngles(arguments: angles)

print(shapeDescription,shapeAngles)


class NamedShape {
    
    var numberOfSides: Int = 0
    var name: String
    //create an initailizer to set up the class when an instance is created.
    init(name:String) {
       self.name = name
    }
    func simpleDescription() -> String {
        
        return "A shape with \(numberOfSides) sides."
        
    }
}
//Subclass Square
class Square:NamedShape {

    var sideLength:Double
    
    
    init(sideLength:Double, name:String) {
       
        self.sideLength = sideLength
        
        super.init(name: name)
        numberOfSides = 4
        
    }
    
    func area() -> Double {
      
        return sideLength * sideLength
    
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}


//create an instance
let test = Square(sideLength: 5.2, name: "my test square")

test.area()
test.simpleDescription()

//Class Circle
class Circle:NamedShape {

    var radius:Double
    
    init(radius:Double, name:String) {
        
        self.radius = radius
        
        super.init(name: name)
        numberOfSides = 8
        
    }
    
    func area() -> Double {
        
        return 3.14 * radius * radius
        
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
    
}

//create an instance
let testCircle = Circle(radius: 5.2, name: "my test circle")

testCircle.area()
testCircle.simpleDescription()


//Perimeter
//In the setter for perimeter,the new value has the implicit name newValue
//You can provide an explicit name in parentheses after set.
class EquilateralTriangle: NamedShape{

    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        
         self.sideLength = sideLength
        
         super.init(name:name)
        
         numberOfSides = 3
        
    }
    
    var preimeter: Double {
    
        get {
        
          return 3.0 * sideLength
            
        }
        
        set {
          //explicit name sideLength
          //implicit name newValue
          sideLength = newValue / 3.0
            
        }
    }
    
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name:"a triangle")

print(triangle.preimeter)

triangle.preimeter = 9.9

print(triangle.sideLength)


/*“If you don’t need to compute the property
but still need to provide code that is run before
and after setting a new value, use willSet and didSet.
he code you provide is run any time the value changes
outside of an initializer.”
*/

class TriangleAndSquare {

    var triangle: EquilateralTriangle {
    
        willSet {
          square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
    
        willSet {
        
          triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name:String) {
        
        square = Square(sideLength: size, name:name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
        
    }

}

var triangleAndSquare = TriangleAndSquare(size: 10, name:"another test shape")

print(triangleAndSquare.square.sideLength)

print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")

print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "Optional square")

let sideLength = optionalSquare?.sideLength

//Enumerations and Structures

//Enumerations --key word enum

enum Rank: Int {

    case ace = 1, acw = 2
    
    case two, three, four, five, six, seven, eight, nine, ten
    
    case jack, queen, king
    
    func simpleDescription() -> String {
     
        
        switch self {
     
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "king"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        
        }
    }
    //compare two Rank values by their raw values
    func comparedTwoRawValues(raw1: Int, raw2: Int) -> String {
    
        if raw1 > raw2 {
            return "raw1 greater than raw2"
            
        }else {
            
            return "raw1 less than raw2"
        }
    }
}

let ace = Rank.ace

let aceRawValue = ace.rawValue
let acwRawValue = Rank.acw.rawValue

//Rank.comparedTwoRawValues is not correct
let result = ace.comparedTwoRawValues(raw1: aceRawValue,raw2: acwRawValue)

let description = ace.simpleDescription() 

//By default,Swift assigns the raw values starting at zero and incrementing by one 
//each time, but you can change this behavior by explicitly specifying values.


if let convertedRank = Rank(rawValue: 3) {
   
    let threeDescription = convertedRank.simpleDescription()
    
}



enum Suit {
   case spades, hearts, diamonds, clubs
    
   func simpleDescription()-> String {
    
      switch self {
        
      case .spades:
        
         return "spades"
        
      case .hearts:
        
         return "hearts"
        
      case .diamonds:
        
        return "diamonds"
        
      case .clubs:
        
        return "clubs"
      
    
      }
    }
    func color()-> String {
        
        switch self {
            
        case .spades:
            
            return "black"
            
        case .hearts:
            
            return "red"
            
        case .diamonds:
            
            return "red"
            
        case .clubs:
            
            return "black"
            
            
        }
    }
}

let hearts = Suit.hearts

let heartsDescription = hearts.simpleDescription()

let heartscolor = hearts.color()






















