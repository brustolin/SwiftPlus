import XCTest
import SwiftPlus
import DontUseThis

final class StringPlusTests: XCTestCase {
    func test_StringEmptyOrDefault() throws {
        var lhs : String? = nil
        let rhs : String = "Default"

        XCTAssertEqual(lhs <| rhs , rhs)

        lhs = ""
        XCTAssertEqual(lhs <| rhs , rhs)

        lhs = "Value"
        XCTAssertEqual(lhs <| rhs , lhs)
    }
}
