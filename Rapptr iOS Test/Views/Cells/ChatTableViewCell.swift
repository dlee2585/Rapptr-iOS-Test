//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    static let nibName = "ChatTableViewCell"
    static let reuseIdentifier = "ChatTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bodyContainerView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAvatarImageView()
        setupHeader()
        setupBody()
    }
    
    private func setupAvatarImageView() {
        avatarImageView.rounded()
    }
    
    private func setupHeader() {
        header.font = .semibold(size: 13)
        header.textColor = .primaryText
    }
    
    private func setupBody() {
        bodyContainerView.backgroundColor = .white
        bodyContainerView.roundCorners(8)
        bodyContainerView.addBorder(width: 1, color: .secondaryBackground)
       
        body.font = .regular(size: 15)
        body.textColor = .primaryText
        body.numberOfLines = 0
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        avatarImageView.setImage(url: message.avatarURL)
    }
}
