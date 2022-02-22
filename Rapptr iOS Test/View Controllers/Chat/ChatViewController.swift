//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private lazy var chatManager = ChatManager(delegate: self)
    
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        configureNavigationBar()
        chatManager.fetchMessages()
    }
    
    // MARK: - Private
    private func configureTable() {
        chatTable.delegate = self
        chatTable.dataSource = self
        chatTable.register(UINib(nibName: ChatTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
        chatTable.tableFooterView = UIView(frame: .zero)
        chatTable.rowHeight = UITableView.automaticDimension
        chatTable.estimatedRowHeight = 400
        chatTable.separatorStyle = .none
        chatTable.backgroundColor = .background
    }
    
    private func configureNavigationBar() {
        title = "Chat"
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseIdentifier, for: indexPath) as! ChatTableViewCell
        let message = chatManager.messages[indexPath.row]
        cell.setCellData(message: message)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatManager.messages.count
    }
}

extension ChatViewController: ChatManagerDelegate {
    func didUpdateMessages(_ manager: ChatManager, messages: [Message]) {
        DispatchQueue.main.async {
            self.chatTable.reloadData()
        }
    }
    
    func didReceiveError(_ manager: ChatManager, error: Error) {
        print(error)
    }
}
