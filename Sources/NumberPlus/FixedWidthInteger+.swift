
/**
 * Extensions for FixedWidthInteger
 *
 * Everybody know Apple was wrong to not include this in the language 😁
 */
public extension FixedWidthInteger {
    @inlinable
    @discardableResult
    static prefix func ++ (lhs: inout Self) -> Self {
        lhs += 1
        return lhs
    }

    @inlinable
    @discardableResult
    static prefix func -- (lhs: inout Self) -> Self {
        lhs -= 1
        return lhs
    }

    @inlinable
    @discardableResult
    static postfix func ++ (lhs: inout Self) -> Self {
        let res = lhs
        lhs += 1
        return res
    }

    @inlinable
    @discardableResult
    static postfix func -- (lhs: inout Self) -> Self {
        let res = lhs
        lhs -= 1
        return res
    }
}
