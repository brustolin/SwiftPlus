import SwiftSyntaxMacros
import SwiftPlusMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
@testable import MacrosPlus

final class MacrosPlusTests : XCTestCase {
    
    func testGuard() {
        let varOne : String?
        
        varOne = ""
        
        #Guard(varOne)
        
        XCTAssertEqual(varOne, "")
    }
    
    func testOneVarNoResult() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            
            #Guard(varOne)
            """,
            expandedSource:
            """
            let varOne : String?
            
            guard let varOne else { return }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testTwoVarsNoResult() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            let varTwo : Int?
            
            #Guard(varOne, varTwo)
            """,
            expandedSource:
            """
            let varOne : String?
            let varTwo : Int?
            
            guard let varOne, let varTwo else { return }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testTwoVarsReturnNilNoReturnStatement() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            let varTwo : Int?
            
            #Guard(varOne, varTwo, nil)
            """,
            expandedSource:
            """
            let varOne : String?
            let varTwo : Int?
            
            guard let varOne, let varTwo else { return nil }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testReturnString() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            
            #Guard(varOne, "Result")
            """,
            expandedSource:
            """
            let varOne : String?
            
            guard let varOne else { return "Result" }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testReturnArray() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            
            #Guard(varOne, [])
            """,
            expandedSource:
            """
            let varOne : String?
            
            guard let varOne else { return [] }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testReturnResultOfFunction() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            
            #Guard(varOne, defaultResult())
            """,
            expandedSource:
            """
            let varOne : String?
            
            guard let varOne else { return defaultResult() }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testTwoVarsReturnNilWithReturnStatement() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            let varTwo : Int?
            
            #Guard(varOne, varTwo, { return nil })
            """,
            expandedSource:
            """
            let varOne : String?
            let varTwo : Int?
            
            guard let varOne, let varTwo else { return nil }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
    
    func testTwoVarsWithReturn() throws {
        assertMacroExpansion(
            """
            let varOne : String?
            let varTwo : Int?
            var array = [1,2,3]
            
            #Guard(varOne, varTwo, { 
                array.removeAll()
                return
            })
            """,
            expandedSource:
            """
            let varOne : String?
            let varTwo : Int?
            var array = [1,2,3]
            
            guard let varOne, let varTwo else { 
                array.removeAll()
                return
            }
            """,
            macros: ["Guard": GuardMacro.self]
        )
    }
}
