//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

struct MessagesResult: Decodable {
    let data: [Message]
}

struct Message: Decodable {
    let userID: String
    let username: String
    let avatarURL: URL?
    let text: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username = "name"
        case avatarURL = "avatar_url"
        case text = "message"
    }
}
