//
//  UIColor+Theme.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation
import UIKit

extension UIColor {
    // #1B1E1F
    static let primaryText = UIColor(r: 27, g: 30, b: 31)
    
    static let background = UIColor(r: 249, g: 249, b: 249)
    
    static let headerBackground = UIColor(r: 14, g: 92, b: 137)
    
    static let headerText = UIColor(r: 255, g: 255, b: 255)
    
    static let secondaryBackground = UIColor(r: 239, g: 239, b: 239)
    
    static let buttonBackground = UIColor(r: 14, g: 92, b: 137)
    
    static let buttonText = UIColor(r: 255, g: 255, b: 255)
    
    static let accentText = UIColor(r: 95, g: 96, b: 99)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
