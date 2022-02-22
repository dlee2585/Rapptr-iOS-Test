//
//  UIView+Custom.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(_ value: CGFloat) {
        layer.cornerRadius = value
        clipsToBounds = true
    }
    
    func rounded() {
        roundCorners(frame.width / 2)
    }
}

extension UIView {
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
