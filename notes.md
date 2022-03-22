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
