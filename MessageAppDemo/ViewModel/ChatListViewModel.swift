//
//  ChatListViewModel.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct ChatListViewModel {
    
    var chatList: Driver<Array<Message>>
    var messages = PublishRelay<Array<Message>>()
    
    init() {
        chatList = messages.asDriver(onErrorJustReturn: [])
    }
    
    func loadChatList(){
        let user1 = User(id: "1", name: "山田太郎")
        let user2 = User(id: "2", name: "田中花子")
        messages.accept( [
            Message(id: "1", content: "こんにちは",send_at: Date(), sender:user1),
            Message(id: "2", content: "こんにちは",send_at: Date(), sender:user2),
            Message(id: "3", content: "こんにちは",send_at: Date(), sender:user1),
        ])
    }
}