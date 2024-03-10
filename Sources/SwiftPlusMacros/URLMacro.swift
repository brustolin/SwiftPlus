//
//  File.swift
//
//
//  Created by Dhiogo Brustolin on 03.03.24.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public struct URLMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard
            let argument = node.argumentList.first?.expression,
            let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
            segments.count == 1,
            case .stringSegment(let literalSegment)? = segments.first
        else {
            throw URLMacroError.requiresStringLiteral
        }
        
        guard let _ = URL(string: literalSegment.content.text) else {
            throw URLMacroError.invalidURL(urlString: argument.description)
        }
        
        return "URL(string: \(argument))!"
    }
}

enum URLMacroError: Error, CustomStringConvertible {
    case invalidURL(urlString: String)
    case requiresStringLiteral
    
    var description: String {
        switch self {
        case .invalidURL(let urlString):
            "This URL is not valid: \(urlString)"
        case .requiresStringLiteral:
            "#URL requires a string literal"
        }
    }
}
