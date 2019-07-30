import Foundation

struct Interactor {
  let apiService: APIServiceProtocol
  let presenter: PresenterProtocol

  init(presenter: PresenterProtocol, apiService: APIServiceProtocol = APIInteractorService()) {
    self.apiService = apiService
    self.presenter = presenter
  }

  func doSomething() {
    apiService.fetchSomething { statusCode in
      self.presenter.present(number: statusCode)
    }
  }
}
