//
//  UIFont+Theme.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation
import UIKit

extension UIFont {
    static func semibold(size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .semibold)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .regular)
    }
}
