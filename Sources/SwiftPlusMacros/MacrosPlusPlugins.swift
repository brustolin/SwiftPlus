//
//  File.swift
//  
//
//  Created by Dhiogo Brustolin on 03.03.24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacrosPlusPlugins: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        URLMacro.self,
        GuardMacro.self,
    ]
}
