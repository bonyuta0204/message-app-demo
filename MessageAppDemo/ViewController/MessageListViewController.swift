//
//  ViewController.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import UIKit
import RxSwift

class MessageListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    var dataSource :UITableViewDiffableDataSource<Int, Message>!
    var snapshot = NSDiffableDataSourceSnapshot<Int, Message>()

    let viewModel = MessageListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        bind()
        viewModel.loadMessageList()
    }
    
    func configure(){
        tableView.delegate = self
        tableView.register(UINib(nibName:"MessageListCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.estimatedRowHeight = 66
        tableView.rowHeight = UITableView.automaticDimension
        
        dataSource = UITableViewDiffableDataSource<Int, Message>(tableView: tableView, cellProvider:  {
            (tableView: UITableView, indexPath: IndexPath, message: Message) -> UITableViewCell? in
            // configure and return cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageListCell
       
            return cell.configure(with: message)
        })
        
        snapshot.appendSections([0])
    }
    
    
}

extension MessageListViewController{
    func bind(){
        viewModel.messageList.drive(onNext: {messages in
            self.snapshot.appendItems(messages, toSection: 0)
            self.dataSource.apply(self.snapshot)
        }
        ).disposed(by: disposeBag)
    }
}


extension MessageListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let messageViewModel = MessageViewModel(channelId: viewModel.messages.value[indexPath.row].channelId)
        let messageViewController = MessageViewController(messageViewModel)
        messageViewModel.loadMessageList()
        navigationController?.pushViewController(messageViewController, animated: true)
        
    }
    
}
