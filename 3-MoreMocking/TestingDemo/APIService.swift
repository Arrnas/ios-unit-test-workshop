import Foundation

typealias CompletionClosure = (_ code: Int) -> ()

protocol APIServiceProtocol {
  func fetchSomething(completion: @escaping CompletionClosure)
}

struct APIInteractorService: APIServiceProtocol {
  func fetchSomething(completion: @escaping CompletionClosure) {
    let url = URL(string: "https://google.com")!
    let session = URLSession(configuration: URLSessionConfiguration())
    session.dataTask(with: url) { _, response, _ in
      completion((response as? HTTPURLResponse)?.statusCode ?? -1)
    }
  }
}
