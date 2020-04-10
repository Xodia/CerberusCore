import XCTest
@testable import CerberusCore

final class CerberusCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CerberusCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
