//
//  Group.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Group: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var groupName: String //모임 이름
    var groupImage: String //모임 이미지
    var host: String //모임 주인
    var code: String //모임 참가 코드
    var userList: [User] //모임 구성원 목록
    var promiseList: [Promise] //모임 약속 목록
}
