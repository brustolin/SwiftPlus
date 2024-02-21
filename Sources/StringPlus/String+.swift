public extension String {
    /// Retrieve a character at a specific index in the string.
    subscript (value: Int) -> Character {
        return self[index(startIndex, offsetBy: value)]
    }

    /// Retrieve a substring within a countable range of indices.
    subscript (range: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return self[start..<end]
    }

    /// Retrieve a substring within a closed countable range of indices.
    subscript (range: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return self[start...end]
    }

    /// Retrieve a substring up to a specified index.
    subscript (range: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: range.upperBound)
        return self[startIndex...end]
    }

    /// Retrieve a substring from a specified index to the end of the string.
    subscript (range: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        return self[start..<endIndex]
    }

    /// Retrieve a substring up to a specified index, excluding that index.
    subscript (range: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: range.upperBound)
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
