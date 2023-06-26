public typealias 🧵 = String

public extension 🧵 {
    static func 🎲(_ lhs: 🧵, _ rhs: 🧵) -> 🧵 {
        return Int.random(in: 0...1) == 0 ? lhs : rhs
    }

    static func 🎲(_ options: [🧵]) -> 🧵 {
        let index = Int.random(in: 0..<options.count)
        return options[index]
    }
}
