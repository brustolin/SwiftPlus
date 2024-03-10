//
//  File.swift
//  
//
//  Created by Dhiogo Brustolin on 03.03.24.
//

import Foundation

@freestanding(expression)
public macro URL(_ string: String) -> URL = #externalMacro(module: "SwiftPlusMacros", type: "URLMacro")


@freestanding(codeItem)
public macro Guard(_ entries : Optional<Any> ...) = #externalMacro(module: "SwiftPlusMacros", type: "GuardMacro")
