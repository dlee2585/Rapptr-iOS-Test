//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation



/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

protocol LoginClientDelegate: AnyObject {
    func didSucceedLogin(_ client: LoginProvidable, someString: String)
    func didFailLogin(_ client: LoginProvidable, errorMessage: String?)
}

protocol LoginProvidable {
    var delegate: LoginClientDelegate? { get set }
    func login(email: String, password: String)

}

class LoginClient: LoginProvidable {
    weak var delegate: LoginClientDelegate?
    
    private let url = "http://dev.rapptrlabs.com/Tests/scripts/login.php"
    
    private let networkClient = NetworkClient()
    
    func login(email: String, password: String) {
        let urlString = "\(url)?email=\(email)&password=\(password)"
        networkClient.performRequest(with: urlString , String.self) { [weak self] string in
            guard let self = self else {
                return
            }
            
            self.delegate?.didSucceedLogin(self, someString: string)

        } onError: { [weak self] error in
            guard let self = self else {
                return
            }
            
            self.delegate?.didFailLogin(self, errorMessage: nil)
        }
    }
}
