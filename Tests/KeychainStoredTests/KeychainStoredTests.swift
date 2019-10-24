import XCTest
import KeychainStored

fileprivate struct TestStruct: Codable, Equatable {
    var foo = "Hello"
    var date = Date()
}

final class KeychainStoredTests: XCTestCase {
    
    @KeychainStored(service: "testString") private var wrappedString: String
    @KeychainStored(service: "testStruct") private var wrappedStruct: TestStruct

    override func setUp() {
        wrappedString = nil
        _wrappedString = KeychainStored(service: _wrappedString.service)
        
        wrappedStruct = nil
        _wrappedStruct = KeychainStored(service: _wrappedStruct.service)
    }
    
    override func tearDown() {
        wrappedString = nil
        wrappedStruct = nil
    }

    func testStoreString() {
        XCTAssertNil(self.wrappedString, "Start clean")
        
        let testString = "kaas"
        self.wrappedString = testString
        
        let second = KeychainStored<String, JSONEncoder, JSONDecoder>(service: _wrappedString.service)
        XCTAssertEqual(wrappedString, testString)
        XCTAssertEqual(second.wrappedValue, testString)
        
        let third = KeychainStored<String, JSONEncoder, JSONDecoder>(service: _wrappedStruct.service) // String type with struct service on purpose – to check that the services are correctly separated
        XCTAssertNil(third.wrappedValue) /// Checks that the services are correctly separated
        XCTAssertNil(self.wrappedStruct)
    }
    
    func testStoreStruct() {
        XCTAssertNil(self.wrappedStruct, "Start clean")
        
        let testStruct = TestStruct()
        self.wrappedStruct = testStruct
        
        let second = KeychainStored<TestStruct, JSONEncoder, JSONDecoder>(service: _wrappedStruct.service)
        XCTAssertEqual(wrappedStruct, testStruct)
        XCTAssertEqual(second.wrappedValue, testStruct)
    }
    
    func testDeleting() {
        wrappedString = "Hi!"
        
        let second = KeychainStored<String, JSONEncoder, JSONDecoder>(service: _wrappedString.service)
        XCTAssertNotNil(second.wrappedValue)
        XCTAssertNotNil(wrappedString)
        
        wrappedString = nil
        let third = KeychainStored<String, JSONEncoder, JSONDecoder>(service: _wrappedString.service)
        XCTAssertNil(third.wrappedValue)
        XCTAssertNil(wrappedString)
    }

}
