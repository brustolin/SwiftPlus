public extension String {
    subscript (value: Int) -> Character {
        return self[index(startIndex, offsetBy: value)]
    }

    subscript (range: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        if end < start { return "" }
        return self[start..<end]
    }

    subscript (range: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        if end < start { return "" }
        return self[start...end]
    }

    subscript (range: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: range.upperBound)
        if end < startIndex { return "" }
        return self[startIndex...end]
    }

    subscript (range: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        if endIndex < start { return "" }
        return self[start..<endIndex]
    }

    subscript (range: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: range.upperBound)
        if end < startIndex { return "" }
        return self[startIndex..<end]
    }

    /**
     * Return the first argument if it is not nil nor empty,
     * otherwise return the second argument
     */
    static func <| (lhs: String?, rhs: String) -> String {
        if let left = lhs, !left.isEmpty {
            return left
        }

        return rhs
    }
}
