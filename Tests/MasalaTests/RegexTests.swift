import XCTest

@testable import Masala

final class RegexTests: XCTestCase {
    func testMatchesStringWithItself() {
        XCTAssertTrue("hello" =~ "hello")
        XCTAssertFalse("hello" !~ "hello")
        XCTAssertFalse("hello" ~! #"^hello$"#)
    }

    func testMatchesExpectedRegex() {
        XCTAssertTrue(#"jesse.todisco@jessetodis.co"# =~ #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#)
        XCTAssertTrue(#"jesse.todisco@jessetodis.co"#.matches(#"^jesse\.todisco.*$"#))
        XCTAssertTrue(#"jesse.todisco@jessetodis.co"# =~ #"^jesse\.todisco.*$"#)
    }

    static var allTests = [
        ("testMatchesStringWithItself", testMatchesStringWithItself),
    ]
}
