//
//  MockLoginClient.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation

class MockLoginClient: LoginProvidable {
    weak var delegate: LoginClientDelegate?
    
    var onSuccess: (() -> Void)?
    var onFailure: (() -> Void)?
    var shouldSuceed = true
    
    init() {
        delegate = self
    }
    
    func login(email: String, password: String) {
        if shouldSuceed {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.234) {
                self.delegate?.didSucceedLogin(self, someString: "success")
            }
        } else {
            delegate?.didFailLogin(self, errorMessage: "error")
        }
    }
}

extension MockLoginClient: LoginClientDelegate {
    func didSucceedLogin(_ client: LoginProvidable, someString: String) {
        self.onSuccess?()
    }
    
    func didFailLogin(_ client: LoginProvidable, errorMessage: String?) {
        onFailure?()
    }
}
