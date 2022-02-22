//
//  TextField.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation
import UIKit

class TextField: UITextField {
    private let horizontalInset: CGFloat = 24
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .background.withAlphaComponent(0.8)
        roundCorners(6)
        textColor = .primaryText
        font = .regular(size: 16)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: 0)
    }
}
