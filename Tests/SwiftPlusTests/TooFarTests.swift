import XCTest
import SwiftPlus
import TooFar

final class TooFarTests: XCTestCase {
    func test_TooFar_Equal() {
        XCTAssertEqual("value" ✅ "value", 👍)
        XCTAssertEqual("value" ✅ "Value", 👎)
    }

    func test_Array_Map() {
        let list : 📚 = [1, 2, 3]
        let newList = list.🗺️ { $0 * 2 }

        XCTAssertEqual(newList, [2,4,6])
    }
}
