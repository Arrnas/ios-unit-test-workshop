import XCTest
@testable import TestingDemo

class TestingDemoTests: XCTestCase {
  func testExample() {
    var mockGenerator = MockRandomNumberGenerator()
    XCTAssertEqual(BlackBox.pickRandom(given: [1,2,3,4,5], generator: &mockGenerator), 5)
  }
}

struct MockRandomNumberGenerator: RandomNumberGenerator {
  mutating func next() -> UInt64 {
    return 4 // choosen by fair dice roll.
             // guaranteed to be random.
  }
}
