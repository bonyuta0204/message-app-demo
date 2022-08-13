//
//  Message.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import Foundation
import MessageKit

struct Message: Identifiable, Hashable, MessageType{
    var id = UUID().uuidString
    
    var user: User
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    var channelId: String
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.messageId == rhs.messageId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
    var textContent: String {
        switch(kind){
        case .text(let content): return content
        default: return ""
        }
    }
    var sender: SenderType {
      user
    }
}
