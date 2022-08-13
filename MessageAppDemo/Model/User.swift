//
//  User.swift
//  MessageAppDemo
//
//  Created by Yuta Nakamura on 2022/08/11.
//

import Foundation
import MessageKit

struct User: SenderType {
    var senderId: String
    var displayName: String
    var avatar_url: String
}
