//
//  MenuView.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation
import UIKit

protocol MenuViewDelegate: AnyObject {
    func didTapChatButton(_ menuView: MenuView)
    func didTapLoginButton(_ menuView: MenuView)
    func didTapAnimationButton(_ menuView: MenuView)
}

class MenuView: UIView {
    weak var delegate: MenuViewDelegate?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var chatButton: UIView!
    @IBOutlet weak var loginButton: UIView!
    @IBOutlet weak var animationButton: UIView!
    
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var animationImageView: UIImageView!
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var animationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupButtons()
        setupBackground()
    }
    
    private func setupBackground() {
        backgroundImageView.image = UIImage(asset: .menuBackground)
        backgroundImageView.contentMode = .scaleToFill
    }

    private func setupButtons() {
        setupButton(
            chatButton,
            label: chatLabel,
            imageView: chatImageView,
            text: "CHAT",
            icon: .chat,
            onTap: #selector(tapChatButton)
        )
        
        setupButton(
            loginButton,
            label: loginLabel,
            imageView: loginImageView,
            text: "LOGIN",
            icon: .login,
            onTap: #selector(tapLoginButton)
        )
        
        setupButton(
            animationButton,
            label: animationLabel,
            imageView: animationImageView,
            text: "ANIMATION",
            icon: .animation,
            onTap: #selector(tapAnimationButton)
        )
    }
    
    private func setupButton(
        _ button: UIView,
        label: UILabel,
        imageView: UIImageView,
        text: String,
        icon: UIImage.Asset,
        onTap: Selector
    ) {
        button.backgroundColor = .background.withAlphaComponent(0.8)
        button.roundCorners(8)

        label.font = .semibold(size: 16)
        label.textColor = .primaryText
        label.text = text
        
        imageView.image = UIImage(asset: icon)
            
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: onTap)
        button.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapChatButton() {
        delegate?.didTapChatButton(self)
    }
    
    @objc private func tapLoginButton() {
        delegate?.didTapLoginButton(self)
    }
    
    @objc private func tapAnimationButton() {
        delegate?.didTapAnimationButton(self)
    }
}
