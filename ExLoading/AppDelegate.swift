//
//  AppDelegate.swift
//  ExLoading
//
//  Created by 김종권 on 2022/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  static var window: UIWindow { (UIApplication.shared.delegate?.window!)! }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = ViewController()
    self.window?.makeKeyAndVisible()
    
    return true
  }
}
