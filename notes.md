# Notes

Swift started as a language in 2014

## Day 1

Int

- type used for whole number

Double

- type used for `Int`s that have a decimal
- short for "double-precision floating-point number"

Doubles and Ints cannot be added together without first coersing the type:

```
let int = 3
Double(int)

// or

let double = 3.0
Int(double)
```

## Day 2

String interpolation

- two ways to do it

```
"string one" + "string two"

// or

let stringTwo = "string two"
"string one and \(stringTwo)"
```

## Day 3

Dictionaries

- similar to objects in JS
- can provide a default value when accessing key

```
print(employee2["name", default: "Unknown"])
let historyResult = results["history", default: 0]
```

Sets

- like arrays except:
  - order doesn't matter. A set will change the order to optimize for lookup speed
  - a duplicate item cannot be added. A set will only show one of each item
  - lookup is faster than an array

Enums

- can write `case` once and separate other cases with a comma

```
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
```

## Day 4

When to use type annotations (vs type inference)
When:

1. Swift can't figure out what type should be used
2. You want Swift to use a different type from its default
3. You don't want to assign a value to the variable at the time of its declaration

## Day 5

Comparing enums

```
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
```

prints true because small comes before large in thee enum case

Switch Statements

- automatically return at the first case they catch
- `fallthrough` can be used in the case so that Swift does not return out of the switch statement

```
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
```

## Day 6

Loop over an array

- syntax:

```
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
```

- `continue` will exit out of the current iteration of the loop and start the next iteration
- `break` will exit out of the loop entirely

## Day 7

Functions

- arguments must be called in the same order that parameters are defined
- applies with named parameters as well

Returning Tuples from a function

- no need to name tuples since Swift already knows what the name will be

```
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

// can also be written as

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
```

- the elements in the tuple don't necessarily need a name:

```
func getUser() -> (String, String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.0) \(user.1)")
```

- named tuples can be destructured like a dictionary

```
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
let firstName = user.firstName
let lastName = user.lastName

print("Name: \(firstName) \(lastName)")
```

Opting out of naming a parameter in a function:

- use an underscore before the parameter name

```
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)
```

Renaming the parameter

- prepend the param name with the name you'd prefer to use externally

```
func printTimesTables(for number: Int) {
```

- The function can be called with with `printTimesTables(for: 5)` and `number` can still be used in the function body

## Day 8

Adding default values for function params:

```
func printTimesTables(for number: Int, end: Int = 12) {
```

Functions that may throw and error have return types of `throws -> type`:

```
func checkPassword(_ password: String) throws -> String {
```

`try` must be written before calling a function that might throw an error

Multiple catch blocks can be chained based on the error type:

```
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
```

A function can either handle its own errors or use a `throw` to send them back

- aka "bubbling up errors"
- aka "error propagation"

## Day 9

Closure Expression

```
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
```

- `in` marks the end of the parameters and return type, as well as the start of the closure body itself

Functions can be copied and their signatures can be changed:

```
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
```

- `data(1989)` doesn't need to be `data(for: 1989)`

It's not necessary to type args when calling in a closure:

```
let captainFirstTeam = team.sorted(by: { name1, name2 in
```

- because Swift already knows that `name1` and `name2` are strings, from when `sorted` was defined

Trailing closure syntax

- no need to pass `by`, we can start the closure directly

```
let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
```

Shorthand syntax for closures

- instead of defining `name1` and `name2`, we can use the shorthand syntax to use the numbered args

```
let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
```

Trailing closures

```
// function definition

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

// invocation without trailing closures

animate(duration: 3, animations: {
    print("Fade out the image")
})

// invocation with trailing closures

animate(duration: 3) {
    print("Fade out the image")
}
```

Accepting functions as arguments

```
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
```

- the second arg is a function that accepts no params

Functions as args with trailing closures

```
// fn definition

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// invocation

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
```

## Day 10

Structs

- functions defined in a struct that read data are fine as is
- functions that change data must be marked with a `mutating` keyword

```
mutating func takeVacation(days: Int) {
```

- the struct must then be assigned to a `var` because a `let` won't build if it has a mutating function

```
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
```

- variables and constants that belong to structs are called **properties**
- functions that belong to structs are called **methods**
- when we create a constant or a variable out of a struct, we create an **instance**
- when we create an instance we do so with an **initializer** `Album(// initializer)`

Computed properties with a getter and setter

```
var vacationRemaining: Int {
    get {
        vacationAllocated - vacationTaken
    }

    set {
        vacationAllocated = vacationTaken + newValue
    }
}
```

- `newValue` is automatically provided by Swift
- it stores whatever value the user was trying to assign to the property

willSet and didSet

- runs before or after a property is set
- the following code with run the print statement after score was set

```
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1
```

- willSet runs before the new value is set

Initializers

- all properties must have a value by the time the initializer ends
- you can add multiple initializers

## Day 11

Adding `private` to a property

- adding `private` to funds means that funds cannot be mutated directly from outside of the struct
- neither read or write will work on `funds`

```
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
```

private(set)

- means "let anyone read this property but only let internal methods write to it"

`static` keyword

- static means both the studentCount and add() methods belong to the School struct itself rather than to individual instances of the struct
- static does not exist uniquely on instances of the struct
- static methods/properties cannot refer to non-static methods or properties
- non-static methods/properties must always use the type's name before accessing, eg School.studentCount

```
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
```

self vs Self

- self is current value of the struct
- Self refers to the current type

## Day 12

Structs v Classes

- Similarities
  - create and name them
  - properties, methods, access control, property observers
  - custom initializers
- Differences
  - only classes inherit
  - swift won't automatically add a memberwise initializer for classes
  - when you copy a class, both copies share the same data
  - when the final copy of a class is destroyed, Swift runs a deinitializer
  - even if you make a class constant, you can still change it's properties that are variables

Inheritance

- Developer inherits from Employee

```
class Developer: Employee {
```

Override

- changing a method from the parent class involves the `override` keyword

```
override func printSummary() {}
```

Final

- the `final` keyword signifies that the class does not support inheritance
- the class itself can still inherit from other classes
- other classes cannot inherit from a final class

Initializing the superclass' initializer

- Car needs to be initialized with isConvertible
- Vehicle, the superclass, needs to be initialized with isElectric

```
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
```

Deinit

- gets called when the class is destroyed
- gets run when the final copy of the class is destroyed
- we don't call them directly, calling them gets handled by the system

Notes on constant instance and property

- Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
- Constant instance, variable property – a signpost that always points to the same user, but their name can change.
- Variable instance, constant property – a signpost that can point to different users, but their names never change.
- Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.

## Day 13

Protocols

- like creating a contract that a struct/class must adhere to

```
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```

- `name` property must exist and must be readable
- `currentPassengers` must be readable and writable

Opaque return types

```
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
```

- some Equatable makes the return type opaque
- Swift knows the actual data type but we can make our code more flexible
- gets used in SwiftUI with `some View` being returned

Extensions

- add functionality to an existing type

```
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
```

## Day 14

Optionals

- checks to see if a value exists before using it by unwrapping it

```
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
print(square(number: number))
```

- that code wont build because an optional is passed into a function that expects a non-optional
- `if let` statements are a common way to check for values that are optional
- Swift won't let us use an optional without unwrapping it first
- Can also be checked with a `guard let `

```
guard let number = number else {
    print("Missing input")
    return
}
```

- guard allows us to return early from a function if it doesn't have the proper inputs

Nil Coalescing

```
let savedData = loadSavedMessage() ?? ""
```

- if the value preceding the `??` is nil, evaluation falls back to the value on the right
- can be chained:

```
let savedData = first() ?? second() ?? ""
```

- dictionaries offer their own approach, optionally:

```
let crusherScore = scores["Crusher", default: 0]
```

Using try? optional to check a functions returned value

```
func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
```

- can also work with nil coalescing

```
let user = (try? getUser(id: 23)) ?? "Anonymous"
```

- variations for try

```
do {
    let result = try runRiskyFunction()
    print(result)
} catch {
    // it failed!
}

// can be replaces with

if let result = try? runRiskyFunction() {
    print(result)
}
```

## SwiftUI

- cannot have more than 10 children inside a parent
- Group is used to group children
