import XCTest
@testable import SwiftPackLocalization

final class SwiftPackLocalizationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPackLocalization().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
