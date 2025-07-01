//
//  OrientationLock.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-06-30.
//

import SwiftUI

extension View {
    @ViewBuilder
    func forceRotation(orientation: UIInterfaceOrientationMask) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.onAppear() {
                AppDelegate.orientationLock = orientation
            }
            // Reset orientation to previous setting
            let currentOrientation = AppDelegate.orientationLock
            self.onDisappear() {
                AppDelegate.orientationLock = currentOrientation
            }
        } else {
            self
        }
    }
}

extension View {
  @ViewBuilder func supportedInterfaceOrientations(
    _ orientations: UIInterfaceOrientationMask
  ) -> some View {
    modifier(SupportedInterfaceOrientationsModifier(orientations: orientations))
  }
}

private struct SupportedInterfaceOrientationsModifier: ViewModifier {
  let orientations: UIInterfaceOrientationMask

  @State private var previousOrientations = UIInterfaceOrientationMask.portrait

  func body(content: Content) -> some View {
    content
      .onAppear() {
        previousOrientations = AppDelegate.supportedInterfaceOrientations
        AppDelegate.supportedInterfaceOrientations = orientations
      }
      .onDisappear() {
        AppDelegate.supportedInterfaceOrientations = previousOrientations
      }
  }
}

enum Orientation: Int, CaseIterable {
    case landscapeLeft
    case landscapeRight
    
    var title: String {
        switch self {
        case .landscapeLeft:
            return "LandscapeLeft"
        case .landscapeRight:
            return "LandscapeRight"
        }
    }
    
    var mask: UIInterfaceOrientationMask {
        switch self {
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        }
    }
}
