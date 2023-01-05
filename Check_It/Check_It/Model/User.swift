//
//  Model.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var userImg: String //유저 이미지
    var userName: String //유저 이름
    var groups: [Group] //유저가 속한 그룹명
}
