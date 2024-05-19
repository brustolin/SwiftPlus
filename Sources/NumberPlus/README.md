# Number+

The Number+ extension provides additional functions to deal with number.

## Usage

### Increment and Decrement (`++` and `--`)

You missed it and we know! And now we got it back!

You can use it as prefix or postfix.

```swift
var myNumber = 0
print(myNumber++) // prints 0 and increment myNumber to 1
print(myNumber--) // prints 1 and decrement myNumber to 0
print(++myNumber) // Increment myNumber to 1 and print it
print(--myNumber) // Decrement myNumber to 0 and print it
```

### Implicit arithmetic operations between `Int` and `FloatingPoint`

**Features**

- Allows Implicit arithmetic operations (+, -, *, /) between `Int` and `any FloatingPoint` type (Float, Double, etc.).
- Ensures the result of operations between Int and FloatingPoint is always a FloatingPoint.

The following code, that usually is an error, will now compile: 

```swift
let x = 1
let y = 2.5

print("\(x + y)")
```
