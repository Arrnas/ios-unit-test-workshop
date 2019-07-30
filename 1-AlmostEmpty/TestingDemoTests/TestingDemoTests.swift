import XCTest
@testable import TestingDemo

class TestingDemoTests: XCTestCase {
  func testExample() {
    XCTAssertEqual(BlackBox.add(2,2), 4)
  }

  func testPerformanceExample() {
    self.measure {
      BlackBox.wait(for: 5)
    }
  }
}

