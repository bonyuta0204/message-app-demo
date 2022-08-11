//
//  Message.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import Foundation

struct Message: Identifiable, Hashable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String
    var content: String
    var send_at: Date
    var sender: User
}
