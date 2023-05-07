//
//  ReactionButton+protocols.swift
//  ReactionButton
//
//  Created by Jorge R Ovalle Z on 4/11/18.
//

import UIKit

/// Describes a type that is informed of events occurring within a `ReactionButton`.
public protocol ReactionButtonDelegate: AnyObject {

  /// The user selected an option from the sender.
  ///
  /// - Parameters:
  ///   - reactionButton: The `ReactionButton` which is sending the action.
  ///   - index: Index of the selected option.
  func reactionButton(_ reactionButton: ReactionButton, didSelectIndex index: Int)

  /// The user is moving through the options.
  /// - Parameters:
  ///   - reactionButton: The `ReactionButton` which is sending the action.
  ///   - index: Index of the selected option.
  func reactionButton(_ reactionButton: ReactionButton, didChangeFocusTo index: Int?)

  /// The user cancelled the option selection.
  ///
  /// - Parameter reactionButton: The `ReactionButton` which is sending the action.
  func reactionButton(didCancelActionFor reactionButton: ReactionButton)

}

public protocol ReactionButtonDelegateLayout: ReactionButtonDelegate {
  func reactionButton(configurationFor reactionButton: ReactionButton) -> ReactionButton.Config
}

public extension ReactionButtonDelegateLayout {
  func reactionButton(configurationFor reactionButton: ReactionButton) -> ReactionButton.Config {
    .default
  }
}

/// Default implementation for delegate
public extension ReactionButtonDelegate {
  func reactionButton(_ reactionButton: ReactionButton, didSelectIndex index: Int) {}
  func reactionButton(_ reactionButton: ReactionButton, didChangeFocusTo index: Int?) {}
  func reactionButton(didCancelActionFor sender: ReactionButton) {}
}

public protocol ReactionButtonDataSource: AnyObject {

  /// Asks the data source to return the number of items in the ReactionButton.
  func reactionButton(numberOfOptionsFor reactionButton: ReactionButton) -> Int

  /// Asks the data source for the view of the specific item.
  func reactionButton(_ reactionButton: ReactionButton, viewForIndex index: Int) -> UIView

  /// Asks the data source for the name of the specific item.
  func reactionButton(_ reactionButton: ReactionButton, nameForIndex index: Int) -> String
}
