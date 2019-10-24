import XCTest

import KeychainStoredTests

var tests = [XCTestCaseEntry]()
tests += KeychainStoredTests.allTests()
XCTMain(tests)
