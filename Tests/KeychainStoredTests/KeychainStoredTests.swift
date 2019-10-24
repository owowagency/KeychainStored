import XCTest
@testable import KeychainStored

final class KeychainStoredTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(KeychainStored().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
