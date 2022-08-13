//
//  MessageListViewModel.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct MessageListViewModel {
    
    var messageList: Driver<[Message]>
    var messages = BehaviorRelay<[Message]>(value:[])
    
    init() {
        messageList = messages.asDriver(onErrorJustReturn: [])
    }
    
    func loadMessageList(){
        let user1 = User(senderId: "1", displayName: "山田太郎", avatar_url: "https://robohash.org/taro")
        let user2 = User(senderId: "2", displayName: "田中花子",avatar_url: "https://robohash.org/hanako")
        messages.accept( [
            Message(user: user1, messageId: "1", sentDate: Date(), kind: .text("こんにちは"), channelId: "1" ),
            Message(user: user2, messageId: "2", sentDate: Date(), kind: .text("こんばんは"), channelId: "2"),
            Message(user: user1, messageId: "3", sentDate: Date(), kind: .text("GoodMorning"), channelId: "3")

        ])
    }
}
