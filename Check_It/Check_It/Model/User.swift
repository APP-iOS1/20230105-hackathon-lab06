//
//  Model.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var userImg: String
    var userName: String
    var groups: [Group]
}
