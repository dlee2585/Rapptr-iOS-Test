//
//  PrimaryButton.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .buttonBackground
        tintColor = .buttonText
        titleLabel?.font = .semibold(size: 16)
    }
}
