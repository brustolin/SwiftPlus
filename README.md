# Swift+

Swift+ is a collection of Swift extension files that provide additional functionalities to standard Swift types like String, Number, and more.

## Usage

To use these extensions in your Swift project, you can selectively import parts of the library based on your requirements. Follow the instructions below to import the specific modules you need:

### String Manipulation Extensions
If you only need extensions related to String manipulation, include the following lines in your Package.swift file:

```swift
.package(url: "https://github.com/brustolin/SwiftPlus"),
.product(name: "StringPlus", package: "Swift+")
```
### Number Manipulation Extensions
If you only need extensions related to Number manipulation, include the following lines in your Package.swift file:

```swift
.package(url: "https://github.com/brustolin/SwiftPlus"),
.product(name: "NumberPlus", package: "Swift+")
```

### Object Manipulation Extensions
If you only need extensions related to object manipulation, include the following lines in your Package.swift file:

```swift
.package(url: "https://github.com/brustolin/SwiftPlus"),
.product(name: "ManipulationPlus", package: "Swift+")
```
### All of the above
If you want all of the extensions, include the following lines in your Package.swift file:
```swift
.package(url: "https://github.com/brustolin/SwiftPlus"),
.product(name: "SwiftPlus", package: "Swift+")
```

### Too far
If you want to go too far with extension, you can try the `TooFar` extensions:
```swift
.package(url: "https://github.com/brustolin/SwiftPlus"),
.product(name: "TooFar", package: "Swift+")
```

## Contribution

Contributions are welcome! If you have ideas for improvements or new extensions, feel free to open an issue or submit a pull request.

## License

This project is licensed under the GPL v3 License.
