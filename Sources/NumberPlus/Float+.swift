//
//  File.swift
//  
//
//  Created by Dhiogo Brustolin on 19.05.24.
//

import Foundation
/**
 * Implicit arithmetic operation between Float and Double
 */
public extension Float {
    
    static func / (lhs: Float, rhs: Double) -> Double {
        return Double(lhs) / rhs
    }
    
    static func * (lhs: Float, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func + (lhs: Float, rhs: Double) -> Double {
        return Double(lhs) + rhs
    }
    
    static func - (lhs: Float, rhs: Double) -> Double {
        return Double(lhs) + rhs
    }
    
    static func / (lhs: Double, rhs: Float) -> Double {
        return lhs / Double(rhs)
    }
    
    static func * (lhs: Double, rhs: Float) -> Double {
        return lhs * Double(rhs)
    }
    
    static func + (lhs: Double, rhs: Float) -> Double {
        return lhs + Double(rhs)
    }
    
    static func - (lhs: Double, rhs: Float) -> Double {
        return lhs + Double(rhs)
    }
}
