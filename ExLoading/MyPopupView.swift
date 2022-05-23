//
//  MyPopupView.swift
//  ExLoading
//
//  Created by 김종권 on 2022/05/22.
//

import UIKit
import SnapKit

final class MyPopupView: UIView {
  private let contentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 14
    view.clipsToBounds = true
    return view
  }()
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "팝업 제목"
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.textColor = .black
    label.textAlignment = .center
    return label
  }()
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("확인", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(self.contentView)
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.button)
    
    self.contentView.snp.makeConstraints {
      $0.left.right.equalToSuperview().inset(50)
      $0.top.equalTo(self.snp.bottom)
    }
    self.titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(30)
      $0.left.right.equalToSuperview()
    }
    self.button.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom).offset(50)
      $0.centerX.bottom.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func show(completion: @escaping () -> Void = {}) {
    self.contentView.snp.remakeConstraints {
      $0.centerY.equalToSuperview()
      $0.left.right.equalToSuperview().inset(50)
    }
    UIView.animate(
      withDuration: 0.2,
      delay: 0,
      options: .curveEaseInOut,
      animations: { self.backgroundColor = UIColor.black.withAlphaComponent(0.3) },
      completion: nil
    )
    UIView.animate(
      withDuration: 0.5,
      delay: 0,
      usingSpringWithDamping: 0.76,
      initialSpringVelocity: 0.0,
      options: [],
      animations: self.layoutIfNeeded,
      completion: { _ in completion() }
    )
  }
  func hide(completion: @escaping () -> Void = {}) {
    self.removeFromSuperview()
  }
  
  @objc private func didTapButton() {
    self.hide()
  }
}
