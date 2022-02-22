//
//  LoginManager.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation

protocol LoginManagerDelegate: AnyObject {
    func didSucceedLogin(_ manager: LoginManager, message: String, duration: Int)
    func didFailLogin(_ manager: LoginManager, message: String)
}

class LoginManager {
    weak var delegate: LoginManagerDelegate?
    
    // NOTE: Use actual login client when the endpoint is working
    private lazy var loginClient: LoginProvidable = MockLoginClient()
    
    private var startTime: DispatchTime?
    private var endTime: DispatchTime?
    
    init(delegate: LoginManagerDelegate) {
        self.delegate = delegate
        
        loginClient.delegate = self
    }
    
    func login(email: String, password: String) {
        startTime = DispatchTime.now()
        loginClient.login(email: email, password: password)
    }
}

extension LoginManager: LoginClientDelegate {
    func didSucceedLogin(_ client: LoginProvidable, someString: String) {
        endTime = DispatchTime.now()
        guard let endTime = endTime, let startTime = startTime else {
            delegate?.didSucceedLogin(self, message: "Success", duration: 0)
            return
        }
        
        let duration = Int(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1000000
        
        delegate?.didSucceedLogin(self, message: "Success", duration: duration)
        
        self.startTime = nil
        self.endTime = nil
    }
    
    func didFailLogin(_ client: LoginProvidable, errorMessage: String?) {
        delegate?.didFailLogin(self, message: "Error")
        
        startTime = nil
    }
}
