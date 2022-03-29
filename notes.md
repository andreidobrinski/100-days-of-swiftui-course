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
