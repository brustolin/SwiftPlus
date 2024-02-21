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
func .. <TYPE>(lhs : TYPE, rhs : (TYPE) -> Void) -> TYPE where TYPE : AnyObject {
    rhs(lhs)
    return lhs
}

/**
 * Use the given object as argument to a closure.
 *
 * Use this with the return of functions, or chained properties that need to be modified.
 *
 * ```
 * UINavigationBar.appearance() <- {
 *  $0.barTintColor = .blue
 *  $0.prefersLargeTitles = true
 * }
 *
 * ```
 */
@inlinable
func <- <TYPE>(lhs : TYPE, rhs : (TYPE) -> Void) where TYPE : AnyObject {
    rhs(lhs)
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
func >-> <TYPE,RESULT>(lhs : TYPE, rhs :  (TYPE) -> RESULT) -> RESULT {
    return rhs(lhs)
}
