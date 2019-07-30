import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
}

struct BlackBox {
  static func add(_ lhs: Int, _ rhs: Int) -> Int {
    return lhs + rhs
  }

  static func wait(for seconds: Int) {
    sleep(UInt32(Int.random(in: 0...seconds)))
  }
}
