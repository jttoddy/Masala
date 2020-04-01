import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OptionalsTests.allTests),
        testCase(ArrayTests.allTests),
        testCase(RegexTests.allTests),
    ]
}
#endif
