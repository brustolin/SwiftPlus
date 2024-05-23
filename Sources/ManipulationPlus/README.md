# Manipulation+

The Object Operator Functions provide a set of Swift operators to simplify object manipulation operations.

## Usage

### Chain Use Operator `..`
The `..` operator allows you to use the given object as an argument to a closure and returns the same object. This is particularly useful during initialization or when chaining multiple operations.

```swift
// Example Usage:
UIWindow(rootViewController: MyViewController() .. { vc in
    vc.customProperty = "Some Value"
})
```
Without the `..` operator, you would typically initialize the object first, then modify its properties separately:

```swift
// Traditional Approach:
let vc = MyViewController()
vc.customProperty = "Some Value"
UIWindow(rootViewController: vc)
```
You may also use the $0 notation to omit the argument:

```swift
// Omitting Argument:
MyViewController() .. { $0.customProperty = "Some Value" }
```

### Transform Operator `>->`
The `>->` operator allows you to use the given object as an argument to a closure and optionally return a different object. This is particularly useful when you need to transform the object or obtain specific properties from it.

```swift
// Example Usage:
let side = UIScreen.main.bounds >-> { min($0.width, $0.height) }
```

By using the `>->` operator, you can reduce chaining and variable creation, making your code more concise and readable.
