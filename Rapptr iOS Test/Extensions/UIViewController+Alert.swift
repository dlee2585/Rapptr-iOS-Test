//
//  UIViewController+Alert.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/22/22.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String? = nil, onCompletion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
            onCompletion?()
        }))
        
        present(alert, animated: true)
    }
}
