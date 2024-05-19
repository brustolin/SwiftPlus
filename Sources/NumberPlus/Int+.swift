//
//  File.swift
//  
//
//  Created by Dhiogo Brustolin on 19.05.24.
//

import Foundation

public extension Int {
    static func / <FLOATING : FloatingPoint>(lhs: Int, rhs: FLOATING) -> FLOATING {
        return FLOATING(lhs) / rhs
    }
    
    static func * <FLOATING : FloatingPoint>(lhs: Int, rhs: FLOATING) -> FLOATING {
        return FLOATING(lhs) * rhs
    }
    
    static func + <FLOATING : FloatingPoint>(lhs: Int, rhs: FLOATING) -> FLOATING {
        return FLOATING(lhs) + rhs
    }
    
    static func - <FLOATING : FloatingPoint>(lhs: Int, rhs: FLOATING) -> FLOATING {
        return FLOATING(lhs) + rhs
    }
    
    static func / <FLOATING : FloatingPoint>(lhs: FLOATING, rhs: Int) -> FLOATING {
        return lhs / FLOATING(rhs)
    }
    
    static func * <FLOATING : FloatingPoint>(lhs: FLOATING, rhs: Int) -> FLOATING {
        return lhs * FLOATING(rhs)
    }
    
    static func + <FLOATING : FloatingPoint>(lhs: FLOATING, rhs: Int) -> FLOATING {
        return lhs + FLOATING(rhs)
    }
    
    static func - <FLOATING : FloatingPoint>(lhs: FLOATING, rhs: Int) -> FLOATING {
        return lhs + FLOATING(rhs)
    }
}
