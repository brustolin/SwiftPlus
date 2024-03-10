/**
 * String subscript extensions
 */
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
}

/**
 String null or empty manipulation extensions
 */
public extension String {
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

/**
 * String helper tools extensions
 */
public extension String {
    
    func convertRange(_ range : Range<Int>) -> Range<String.Index> {
        return index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)
    }
    
    func linesInRange(range: Range<String.Index>) -> Range<Int>? {
        var sub = self.suffix(from: startIndex)
        var lineIndex = 0
        var begin : Int? = nil
        var end : Int? = nil
        while (sub.count > 0) {
            let newLine = sub.firstIndex(of: "\n") ?? endIndex
            if newLine > range.lowerBound && begin == nil {
                begin = lineIndex
            }
            if newLine > range.upperBound  {
                end = lineIndex
                break
            }
            sub = self.suffix(from: newLine).dropFirst()
            lineIndex += 1
        }
        
        guard let begin else { return nil }
        return begin..<(end ?? lineIndex)
    }
    
}
