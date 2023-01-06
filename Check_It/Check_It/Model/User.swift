//
//  Model.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    var userEmail: String // 유저 이메일
    var userImg: String //유저 이미지
    var userName: String //유저 이름
    var groups: [String] //유저가 속한 그룹명
    var promises: [String] 
}
