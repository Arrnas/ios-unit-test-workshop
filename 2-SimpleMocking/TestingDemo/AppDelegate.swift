import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
}

struct BlackBox {
  static func pickRandom<G: RandomNumberGenerator>(given: [Int],
                                                   generator: inout G) -> Int? {
    return given.randomElement(using: &generator)
  }

  static func pickRandom(given: [Int]) -> Int? {
    var generator = SystemRandomNumberGenerator()
    return pickRandom(given: given, generator: &generator)
  }
}
