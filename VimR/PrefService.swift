/**
 * Tae Won Ha - http://taewon.de - @hataewon
 * See LICENSE
 */

import Foundation

fileprivate let defaults = UserDefaults.standard

class PrefService {

  typealias MainWindowPair = StateActionPair<AppState, UuidAction<MainWindow.Action>>

  static let compatibleVersion = "168"
  static let lastCompatibleVersion = "128"

  func applyPref<ActionType>(_ pair: StateActionPair<AppState, ActionType>) {
    defaults.setValue(pair.state.dict(), forKey: PrefService.compatibleVersion)
  }

  func applyMainWindow(_ pair: MainWindowPair) {
    guard case .close = pair.action.payload else {
      return
    }

    defaults.setValue(pair.state.dict(), forKey: PrefService.compatibleVersion)
  }
}
