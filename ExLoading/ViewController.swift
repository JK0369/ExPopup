//
//  ViewController.swift
//  popup
//
//  Created by 김종권 on 2022/05/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private let popupButton: UIButton = {
    let button = UIButton()
    button.setTitle("popup 열기", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  private let dampingAnimationButton: UIButton = {
    let button = UIButton()
    button.setTitle("damping 예제", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(damping), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.popupButton)
    self.view.addSubview(self.dampingAnimationButton)
    
    self.popupButton.snp.makeConstraints {
      $0.top.equalToSuperview().inset(80)
      $0.centerX.equalToSuperview()
    }
    self.dampingAnimationButton.snp.makeConstraints {
      $0.top.equalToSuperview().inset(120)
      $0.centerX.equalToSuperview()
    }
  }
  
  @objc private func didTapButton() {
    guard !self.view.subviews.contains(where: { $0 is MyPopupView }) else { return }
    let popupView = MyPopupView()
    self.view.addSubview(popupView)
    popupView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    self.view.layoutIfNeeded()
    popupView.show()
  }
  @objc private func damping() {
    self.dampingAnimationButton.snp.remakeConstraints {
      $0.center.equalToSuperview()
    }
    UIView.animate(
      withDuration: 2.0,
      delay: 0,
      usingSpringWithDamping: 0.1,
      initialSpringVelocity: 0.9,
      options: [],
      animations: { self.view.layoutIfNeeded() },
      completion: nil
    )
  }
}
