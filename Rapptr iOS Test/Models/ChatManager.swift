//
//  ChatManager.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/18/22.
//

import Foundation

protocol ChatManagerDelegate: AnyObject {
    func didUpdateMessages(_ manager: ChatManager, messages: [Message])
    func didReceiveError(_ manager: ChatManager, error: Error)
}

class ChatManager {
    weak var delegate: ChatManagerDelegate?
    
    var messages = [Message]()
    var error: Error?
    
    private lazy var chatClient = ChatClient(delegate: self)
    
    init(delegate: ChatManagerDelegate) {
        self.delegate = delegate
    }
    
    func fetchMessages() {
        chatClient.fetchChatData()
    }
}

extension ChatManager: ChatClientDelegate {
    func didFetchChat(_ client: ChatClient, messages: [Message]) {
        self.messages = messages
        delegate?.didUpdateMessages(self, messages: messages)
    }
    
    func failedToFetchChat(_ client: ChatClient, error: Error) {
        self.error = error
        delegate?.didReceiveError(self, error: error)
    }
}
