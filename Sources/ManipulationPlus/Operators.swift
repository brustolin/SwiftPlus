/**
 * Chain use operator
 */
infix operator .. : AssignmentPrecedence

/**
 * Scope use operator
 */
infix operator <- : AssignmentPrecedence

/**
 * Transform operator
 */
infix operator >-> : AssignmentPrecedence

/**
 * Casting Nil-Coalescing Operator
 */
infix operator ??? : CastingPrecedence
