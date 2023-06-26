public extension Int {
    static postfix func ++(value :inout Self) -> Self {
        let res = value
        value += 1
        return res
    }

    static prefix func ++(value :inout Self) -> Self {
        value += 1
        return value
    }
}
