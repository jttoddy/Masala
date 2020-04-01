import XCTest

@testable import Masala

final class ArrayTests: XCTestCase {
    func testAddingElements() {
        var array: [Any] = []
        array = array.appending("something")
        XCTAssert(array.first as? String == "something")

        array = array.appending("another thing").appending("one more thing")

        XCTAssert(array.count == 3)
        XCTAssert(array as? [String] == ["something", "another thing", "one more thing"])
    }

    static var allTests = [
        ("testAddingElements", testAddingElements)
    ]
}
