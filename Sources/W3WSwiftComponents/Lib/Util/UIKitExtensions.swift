//
//  ViewController.swift
//  Simple Coordinator
//
//  Created by Lshiva on 17/05/2020.
//  Copyright © 2020 what3words. All rights reserved.
//

import Foundation
import UIKit


// MARK: UIView


extension UIView {
  var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    while parentResponder != nil {
      parentResponder = parentResponder!.next
      if let viewController = parentResponder as? UIViewController {
        return viewController
      }
    }
    return nil
  }
}


// MARK: UIColor

extension UIColor {

  // allow instantiation of a UIColor from a html/css type hex string
  convenience init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (0, 0, 0, 1)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }

  
  // allow instantiation of a UIColor from a hexadecimal number and optional alpha value
  convenience init(hex: Int, alpha: CGFloat = 1.0) {
    let red   = CGFloat((hex >> 16) & 0xFF)
    let green = CGFloat((hex >> 8) & 0xFF)
    let blue  = CGFloat(hex & 0xFF)

    self.init(
      red: red / 255.0,
      green: green / 255.0,
      blue: blue / 255.0,
      alpha: alpha
    )
  }
  
}


