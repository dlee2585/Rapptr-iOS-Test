//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    @IBOutlet weak var loginView: LoginView!
    
    private lazy var loginManager = LoginManager(delegate: self)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        loginView.delegate = self
    }
    
    private func configureNavigationBar() {
        title = "Login"
    }
}

extension LoginViewController: LoginViewDelegate {
    func didPressLogin(_ loginView: LoginView, email: String, password: String) {
        loginManager.login(email: email, password: password)
    }
}

extension LoginViewController: LoginManagerDelegate {
    func didSucceedLogin(_ manager: LoginManager, message: String, duration: Int) {
        presentAlert(title: message, message: "login took \(duration) milliseconds") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func didFailLogin(_ manager: LoginManager, message: String) {
        presentAlert(title: message)
    }
}
