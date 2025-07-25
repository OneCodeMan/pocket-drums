//
//  AppDelegate.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var supportedInterfaceOrientations = UIInterfaceOrientationMask.portrait {
        didSet { updateSupportedInterfaceOrientationsInUI() }
      }

    static var orientationLock = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientationLock))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if orientationLock == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
}

extension AppDelegate {
  private static func updateSupportedInterfaceOrientationsInUI() {
    if #available(iOS 16.0, *) {
      UIApplication.shared.connectedScenes.forEach { scene in
        if let windowScene = scene as? UIWindowScene {
          windowScene.requestGeometryUpdate(
            .iOS(interfaceOrientations: supportedInterfaceOrientations)
          )
        }
      }
      UIViewController.attemptRotationToDeviceOrientation()
    } else {
      if supportedInterfaceOrientations == .landscape {
        UIDevice.current.setValue(
          UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation"
        )
      } else {
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
      }
    }
  }

  func application(
    _ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?
  ) -> UIInterfaceOrientationMask {
    Self.supportedInterfaceOrientations
  }
}
