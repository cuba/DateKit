import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DayTests.allTests),
        testCase(TimeTests.allTests),
        testCase(DayTimeTests.allTests),
        testCase(DurationTests.allTests)
    ]
}
#endif
