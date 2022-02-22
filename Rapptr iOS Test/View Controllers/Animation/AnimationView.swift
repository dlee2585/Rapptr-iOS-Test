//
//  AnimationView.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/21/22.
//

import Foundation
import UIKit

class AnimationView: UIView {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var fadeButton: PrimaryButton!
    
    private var isLogoVisible: Bool {
        logoImageView.alpha > 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .background
        logoImageView.image = UIImage(asset: .logo)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.isUserInteractionEnabled = true
        updateFadeButton()
    }
    
    private func updateFadeButton() {
        fadeButton.setTitle(isLogoVisible ? "FADE OUT" : "FADE IN", for: .normal)
    }
    
    @IBAction func didDragLogo(_ sender: UIPanGestureRecognizer) {
        guard let logoView = sender.view else {
            return
        }
        
        let translation = sender.translation(in: self)
        logoView.center = CGPoint(x: logoView.center.x + translation.x, y: logoView.center.y + translation.y)
        sender.setTranslation(.zero, in: logoView)
    }
    
    @IBAction func didPressFade(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.logoImageView.alpha = self.isLogoVisible ? 0 : 1
        } completion: { _ in
            self.updateFadeButton()
        }
    }
}
