//
//  SampleViewController.swift
//  ReactionButton
//
//  Created by Jorge R Ovalle Z on 2/28/16.
//

import UIKit
import ReactionButton

final class SampleViewController: UIViewController {
  
  @IBOutlet weak var selectorView: ReactionButton!
  @IBOutlet weak var informationLabel: UILabel!
  
  let optionsDataset = [
    (imageName: "img_1", title: "Like"),
    (imageName: "img_2", title: "Smile"),
    (imageName: "img_3", title: "Heart"),
    (imageName: "img_4", title: "Idea"),
    (imageName: "img_5", title: "Slow"),
    (imageName: "img_6", title: "Fast")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    selectorView.delegate = self
    selectorView.dataSource = self
  }
  
}

// MARK: ReactionButtonDelegate
extension SampleViewController: ReactionButtonDelegate {
  
  func reactionButton(_ reactionButton: ReactionButton, didSelectIndex index: Int) {
    informationLabel.text = "Option \(index) selected"
  }
  
  func reactionButton(didCancelActionFor reactionButton: ReactionButton) {
    informationLabel.text = "User cancelled selection"
  }
  
  func reactionButton(_ reactionButton: ReactionButton, didChangeFocusTo index: Int?) {
    guard let index = index else {
      informationLabel.text = "Lost Focus"
      return
    }
    
    informationLabel.text = "Focused on \(index) option"
  }
}

// MARK: ReactionButtonDataSource
extension SampleViewController: ReactionButtonDataSource {
  func reactionButton(_ reactionButton: ReactionButton, nameForIndex index: Int) -> String {
    optionsDataset[index].title
  }
  
  func reactionButton(_ reactionButton: ReactionButton, viewForIndex index: Int) -> UIView {
    let option = optionsDataset[index].imageName
    guard let image = UIImage(named: option) else {
      return UIView()
    }
    return UIImageView(image: image)
  }
  
  func reactionButton(numberOfOptionsFor reactionButton: ReactionButton) -> Int {
    optionsDataset.count
  }
  
}
