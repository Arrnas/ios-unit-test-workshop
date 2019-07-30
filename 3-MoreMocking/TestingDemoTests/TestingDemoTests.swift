import XCTest
@testable import TestingDemo

class TestingDemoTests: XCTestCase {
  var sut: Interactor!
  var mockPresenter: MockPresenter!
  var mockService: MockService!

  override func setUp() {
    mockPresenter = MockPresenter()
    mockService = MockService()
    sut = Interactor(presenter: mockPresenter, apiService: mockService)
  }

  func testServiceCalled() {
    sut.doSomething()
    XCTAssertTrue(mockService.fetchCalled)
  }

  func testPresenterCalled() {
    sut.doSomething()
    XCTAssertEqual(mockPresenter.presentCalledWith, 42)
  }
}

class MockService: APIServiceProtocol {

  var fetchCalled = false
  func fetchSomething(completion: @escaping CompletionClosure) {
    fetchCalled = true
    completion(42)
  }
}

class MockPresenter: PresenterProtocol {

  var presentCalledWith: Int?
  func present(number: Int) {
    presentCalledWith = number
  }
}
