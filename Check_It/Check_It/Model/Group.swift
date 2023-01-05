//
//  Group.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Group: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var groupName: String
    var groupImage: String
    var host: String
    var code: String
    var userList: [User]
    var promiseList: [Promise]
}
