import XCTest
import SwiftPlus

final class IntPlusTests: XCTestCase {
    func test_IntPosIncrement() throws {
        var value = 0

        XCTAssertEqual(value++, 0)
        XCTAssertEqual(value, 1)
    }

    func test_IntPreIncrement() throws {
        var value = 0

        XCTAssertEqual(++value, 1)
        XCTAssertEqual(value, 1)
    }
}
