//
//  LoginView.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func didPressLogin(_ loginView: LoginView, email: String, password: String)
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: PrimaryButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBackgroundImage()
        setupTextFields()
    }
    
    private func setupBackgroundImage() {
        backgroundImageView.image = UIImage(asset: .loginBackground)
        backgroundImageView.contentMode = .scaleToFill
    }
    
    private func setupTextFields() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        delegate?.didPressLogin(self, email: email, password: password)
    }
}
