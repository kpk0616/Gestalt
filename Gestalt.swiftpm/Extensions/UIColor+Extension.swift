//
//  UIColor+Extension.swift
//  
//
//  Created by 박의서 on 2023/04/19.
//

import SwiftUI

// inspired by: https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui
extension Color {
  init(hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xff) / 255,
      green: Double((hex >> 08) & 0xff) / 255,
      blue: Double((hex >> 00) & 0xff) / 255,
      opacity: alpha
    )
  }
}
