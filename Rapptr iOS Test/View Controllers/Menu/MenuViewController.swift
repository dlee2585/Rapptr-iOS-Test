//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - Rapptr Labs
     * =========================================================================================
     */
    @IBOutlet weak var menuView: MenuView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        menuView.delegate = self
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .headerBackground
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.headerText,
            .font: UIFont.semibold(size: 17)
        ]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.tintColor = .headerText
        title = "Coding Tasks"
        
        navigationItem.backButtonTitle = ""
    }
    
    private func navigate(to viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MenuViewController: MenuViewDelegate {
    func didTapChatButton(_ menuView: MenuView) {
        navigate(to: ChatViewController())
    }
    
    func didTapLoginButton(_ menuView: MenuView) {
        navigate(to: LoginViewController())
    }
    
    func didTapAnimationButton(_ menuView: MenuView) {
        navigate(to: AnimationViewController())
    }
}
