//
//  ChatViewController.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/13.
//

import Foundation
import MessageKit

class ChatViewController: MessagesViewController, MessagesDataSource {
    var currentSender: SenderType
    var messages: [Message]
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.row]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }
    
    init(messages: [Message]){
        currentSender = User(senderId: "1", displayName: "田中太朗", avatar_url: "https://example.com")
        self.messages = messages
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
