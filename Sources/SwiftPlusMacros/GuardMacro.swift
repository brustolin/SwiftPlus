//
//  File.swift
//  
//
//  Created by Dhiogo Brustolin on 03.03.24.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public struct GuardMacro: CodeItemMacro {
    public static func expansion(of node: some SwiftSyntax.FreestandingMacroExpansionSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.CodeBlockItemSyntax] {
      
        var arguments = node.argumentList
        var returnExpression : ExprSyntax?
        
        if arguments.last?.expression.is(DeclReferenceExprSyntax.self) == false {
            returnExpression = arguments.last?.expression
            arguments.remove(at: arguments.index(arguments.endIndex, offsetBy: -1))
        }
        
        let names = try arguments.compactMap { arg in
            guard let baseName = arg.expression.as(DeclReferenceExprSyntax.self)?.baseName,
                  case .identifier(let name) = baseName.tokenKind
            else {
                throw GuardMacroError.invalidArgument(argument: "\(arg)")
            }
            return "let \(name)"
        }
        
        return ["guard \(raw: names.joined(separator: ", ")) else \(raw: returnBlock(returnExpression) )"]
    }
    
    private static func returnBlock(_ closure: ExprSyntax?) -> String {
        guard let closure else { return "{ return }" }
        
        if let block = closure.as(ClosureExprSyntax.self) {
            return block.trimmedDescription
        }

        return "{ return \(closure) }"
    }
}

enum GuardMacroError: Error, CustomStringConvertible {
    case invalidArgument(argument : String)
    
    var description: String {
        switch self {
        case .invalidArgument(let argument):
            "Invalid argument: \"\(argument)\" Identifier required"
        }
    }
}
