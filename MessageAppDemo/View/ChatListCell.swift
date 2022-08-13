//
//  ChatListCell.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import UIKit

class ChatListCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageContentLabel: UILabel!
    @IBOutlet weak var sendAtLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    func configure(with message: Message)->ChatListCell{
        userNameLabel.text = message.sender.displayName
        messageContentLabel.text = message.textContent
        let url = URL(string: message.user.avatar_url)
        do {
            let data = try Data(contentsOf: url!)
            let image = UIImage(data: data)
            avatarImage.image = image
        } catch let err {
            print("Error: \(err.localizedDescription)")
        }
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
