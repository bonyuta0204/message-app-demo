//
//  MessageViewController.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/13.
//

import Foundation
import MessageKit
import RxSwift

class MessageViewController: MessagesViewController, MessagesDataSource {
    var currentSender: SenderType
    let viewModel: MessageViewModel
    private let disposeBag = DisposeBag()
    var messages: [Message] = []
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        print(messages)
        print(messages[indexPath.section])
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    init(_ viewModel: MessageViewModel){
        currentSender = User(senderId: "1", displayName: "田中太朗", avatar_url: "https://example.com")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.loadMessageList()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        bind()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageViewController: MessagesLayoutDelegate{
    
}

extension MessageViewController: MessagesDisplayDelegate{
    
}

extension MessageViewController{
    func bind(){
        viewModel.messages.drive(onNext: {messages in
            self.messages = messages
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToLastItem(animated: false)
        })
        .disposed(by: disposeBag)
    }
}
