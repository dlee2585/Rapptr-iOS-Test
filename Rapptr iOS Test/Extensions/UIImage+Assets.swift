//
//  UIImage+Assets.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation
import UIKit

extension UIImage {
    enum Asset: String {
        // Icons
        case animation = "ic_animation"
        case chat = "ic_chat"
        case login = "ic_login"
        case logo = "ic_logo"
        
        // Background
        case loginBackground = "img_login"
        case menuBackground = "bg_home_menu"
    }
    
    convenience init?(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
