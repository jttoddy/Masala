import XCTest

@testable import Masala

final class OptionalsTests: XCTestCase {
    func testSafelyUnwrapsString() {
        let nilString: String? = nil
        let emptyString: String? = ""
        let populatedString: String? = "value"

        XCTAssertEqual(nilString.safelyUnwrapped, "")
        XCTAssertEqual(emptyString.safelyUnwrapped, "")
        XCTAssertEqual(populatedString.safelyUnwrapped, "value")

        XCTAssertTrue(nilString.isNilOrEmpty)
        XCTAssertTrue(emptyString.isNilOrEmpty)
        XCTAssertFalse(populatedString.isNilOrEmpty)
    }

    static var allTests = [
        ("testSafelyUnwrapsString", testSafelyUnwrapsString),
    ]
}
