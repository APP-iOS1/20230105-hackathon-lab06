//
//  ViewModel.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase

class GroupStore: ObservableObject {
    @Published var groups: [Group]
    
    let database = Firestore.firestore()
    
    init(groups: [Group] = []) {
        self.groups = groups
    }
    
    //그룹추가하기
    func addGroup(newGroup: Group) {
        database.collection("Group")
            .document("\(newGroup.id)")
            .setData(["id": newGroup.id,
                      "groupName" : newGroup.groupName,
                      "groupImage" : newGroup.groupImage,
                      "host" : newGroup.host,
                      "code" : newGroup.code,
                      "userList" : newGroup.userList,
                      "promiseList" : newGroup.promiseList
            ])
    }
    
    //그룹 목록 Fetch --> 현호님 예정
    
    //
}
