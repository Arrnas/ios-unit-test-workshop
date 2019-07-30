import Foundation

protocol PresenterProtocol {
  func present(number: Int)
}

struct Presenter: PresenterProtocol {
  func present(number: Int) {
    print(number)
  }
}
