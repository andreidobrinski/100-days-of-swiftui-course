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
