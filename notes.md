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
