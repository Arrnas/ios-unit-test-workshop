import XCTest
import SwiftyMocky
@testable import TestingDemo

class TestingDemoTests: XCTestCase {
  var sut: Interactor!
  var mockPresenter: PresenterProtocolMock!
  var mockService: APIServiceProtocolMock!

  override func setUp() {
    mockPresenter = PresenterProtocolMock()
    mockService = APIServiceProtocolMock()
    Perform(mockService, .fetchSomething(completion: .any, perform: { completion in
      completion(42)
    }))
    sut = Interactor(presenter: mockPresenter, apiService: mockService)
  }

  func testServiceCalled() {
    sut.doSomething()
    Verify(mockService, .fetchSomething(completion: .any))
  }

  func testPresenterCalled() {
    sut.doSomething()
    Verify(mockPresenter, 1, .present(number: .value(42)))
  }
}
