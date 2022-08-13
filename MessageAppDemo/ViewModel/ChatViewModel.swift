//
//  ChatViewModel.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/13.
//

import Foundation
import RxSwift
import RxCocoa

struct ChatViewModel{
    let channelId: String
    
    var messages: Driver<[Message]>
    var _messages = BehaviorRelay<[Message]>(value:[])
    
    init(channelId: String) {
        self.channelId = channelId
        messages = _messages.asDriver(onErrorJustReturn: [])
    }
    
    func loadChatList(){
        let user1 = User(senderId: "1", displayName: "山田太郎", avatar_url: "https://robohash.org/taro")
        let user2 = User(senderId: "2", displayName: "田中花子",avatar_url: "https://robohash.org/hanako")
        _messages.accept( [
            Message(user: user1, messageId: "1", sentDate: Date(), kind: .text("こんにちは"), channelId: "1"),
            Message(user: user2, messageId: "2", sentDate: Date(), kind: .text("こんばんは"), channelId: "2"),
            Message(user: user1, messageId: "3", sentDate: Date(), kind: .text("Good Morning"), channelId: "3")

        ])
    }
}
