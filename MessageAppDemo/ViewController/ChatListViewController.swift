//
//  ViewController.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import UIKit
import RxSwift

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    var dataSource :UITableViewDiffableDataSource<Int, Message>!
    var snapshot = NSDiffableDataSourceSnapshot<Int, Message>()

    let viewModel = ChatListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        bind()
        viewModel.loadChatList()
    }
    
    func configure(){
        tableView.delegate = self
        tableView.register(UINib(nibName:"ChatListCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        dataSource = UITableViewDiffableDataSource<Int, Message>(tableView: tableView, cellProvider:  {
            (tableView: UITableView, indexPath: IndexPath, message: Message) -> UITableViewCell? in
            // configure and return cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatListCell
       
            return cell.configure(with: message)
        })
        
        snapshot.appendSections([0])
    }
    
    
}

extension ChatListViewController{
    func bind(){
        viewModel.chatList.drive(onNext: {messages in
            self.snapshot.appendItems(messages, toSection: 0)
            self.dataSource.apply(self.snapshot)
        }
        ).disposed(by: disposeBag)
    }
}


extension ChatListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = viewModel.messages.value[indexPath.row]
        print(message)
    }
    
}
