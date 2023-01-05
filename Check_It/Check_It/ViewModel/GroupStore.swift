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
    
    //그룹추가하기 - C
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
    
    //그룹 목록 Fetch --> 현호님 예정 - R
    
    //그룹 이름 수정 - U
    func updateGroupName(groupId: String, groupName: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .updateData([
                    "groupName" : groupName
                ])
        } catch {
            print(error)
        }
    }
    
    //그룹 호스트 수정 - U
    func updateHost(host: String, groupId: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .updateData([
                    "host" : host
                ])
        } catch {
            print(error)
        }
    }
    
    //그룹 삭제 - D
    func deleteGroup(groupId: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .delete()
        } catch {
            print(error)
        }
    }
    
}
