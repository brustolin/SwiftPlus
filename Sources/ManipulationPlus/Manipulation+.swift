/**
 * Use the given object as argument to a closure and returns the same object.
 *
 * This is useful during initialization.
 *
 * ```
 * UIWindow(rootViewController: MyViewController() .. { vc in vc.customProperty = "Some Value" })
 * ```
 *
 *  Otherwise you would need to do like this:
 *
 * ```
 *  let vc = MyViewController()
 *  vc.customProperty = "Some Value"
 *  UIWindow(rootViewController: vc)
 * ```
 *
 * You may omit the argument and use the $ notation: `{ $0.customProperty = "Some Value" }`
 */
@inlinable
@discardableResult
public func .. <TYPE>(lhs : TYPE, rhs : (TYPE) -> Void) -> TYPE where TYPE : AnyObject {
    rhs(lhs)
    return lhs
}

/**
 * Use the given object as argument to a closure, you may return a different object.
 *
 * This is useful with function returns or chained properties.
 * Lets say you want the smallest side of the screen, the traditional way would be like this:
 * ```
 * let bounds = UIScreen.main.bounds
 * let side = min(bounds.width, bounds.height)
 * ```
 * or
 * ```
 * let side = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
 *
 * ```
 *
 * by using this operator it will look like this:
 * ```
 * let side = UIScreen.main.bounds >-> { min($0.width, $0.height) }
 * ```
 *
 * You use less chaining and variable creation.
 */
@inlinable
public func >-> <TYPE,RESULT>(lhs : TYPE, rhs :  (TYPE) -> RESULT) -> RESULT {
    return rhs(lhs)
}

/**
 * This Nil-Coalescing Operator will try to cast the first parameter
 * to the same type of the second parameter, so no need to cast when
 * trying to use a nil coalescing operator.
 *
 * In the following example, `cell` will be a `UITableViewCell`, which prevent
 * the developer to call the custom properties and methods.
 *
 * ```
 * let cell = tableview.dequeueReusableCell(withIdentifier: "IDENTIFIER") ??? CustomCellView()
 * ```
 * By using the casting Nil-Coalescing operator `cell` will be a `CustomCellView`
 *
 */
@inlinable
public func ??? <TYPE>(lhs : Any?, rhs : TYPE) -> TYPE {
    return lhs as? TYPE ?? rhs
}
