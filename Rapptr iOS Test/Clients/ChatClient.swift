//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

protocol ChatClientDelegate: AnyObject {
    func didFetchChat(_ client: ChatClient, messages: [Message])
    func failedToFetchChat(_ client: ChatClient, error: Error)
}

class ChatClient {
    private weak var delegate: ChatClientDelegate?
    
    private let url = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    private let networkClient = NetworkClient()
    
    init(delegate: ChatClientDelegate) {
        self.delegate = delegate
    }
    
    func fetchChatData() {
        networkClient.performRequest(with: url, MessagesResult.self) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.delegate?.didFetchChat(self, messages: result.data)
            
        } onError: { [weak self] error in
            guard let self = self else {
                return
            }
            
            self.delegate?.failedToFetchChat(self, error: error)
        }
    }
}
