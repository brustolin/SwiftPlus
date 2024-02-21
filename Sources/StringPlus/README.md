# String+

String+ is an extension for the Swift String class that provides additional functionalities for string manipulation.

## Usage

### Subscripting
Single Int Subscripting

```swift
let str = "Hello, World!"
let char = str[0] // Returns: "H"
```
### Range Subscripting
Range Int subcripting

```swift
let str = "Hello, World!"
let substring = str[0..<5] // Returns: "Hello"
```

+++ Custom Operator <|
The <| operator is used to return the first argument if it is not nil nor empty; otherwise, it returns the second argument.

```swift
let str1: String = ""
let str2 = "Default Value"
let result = str1 <| str2 // Returns: "Default Value"
```

Example

```swift
let str = "Hello, World!"
let char = str[0] // Returns: "H"
let substring = str[0..<5] // Returns: "Hello"

let str1: String? = nil
let str2 = "Default Value"
let result = str1 <| str2 // Returns: "Default Value"
```
