import Quick
import Nimble
@testable import TestingDemo

class InteractorTests: QuickSpec {

  override func spec() {
    var sut: Interactor!
    var mockPresenter: MockPresenter!
    var mockService: MockService!

    describe("doSomething") {
      beforeEach {
        mockPresenter = MockPresenter()
        mockService = MockService()
        sut = Interactor(presenter: mockPresenter, apiService: mockService)
        sut.doSomething()
      }

      it("calls api service") {
        expect(mockService.fetchCalled).to(beTrue())
      }

      it("presents service returned number") {
        expect(mockPresenter.presentCalledWith).to(equal(42))
      }
    }
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
