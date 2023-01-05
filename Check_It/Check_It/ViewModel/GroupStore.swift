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
    
    //그룹 목록 Fetch --> R
    func fetchGroup() {
        database.collection("Group")
            .getDocuments { (snapshot, error) in
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id = document["id"] as? String ?? ""
                        let groupName = document["groupName"] as? String ?? ""
                        let groupImage = document["groupImage"] as? String ?? ""
                        let host = document["host"] as? String ?? ""
                        let code = document["code"] as? String ?? ""
                        let userList = document["userList"] as? [String] ?? []
                        let promiseList = document["promiseList"] as? [String] ?? []
                        
                        self.groups.append(Group(id: id, groupName: groupName, groupImage: groupImage, host: host, code: code, userList: userList, promiseList: promiseList))
                    }
                } 
            }
    }
    
    //그룹 이름 수정 - U --> ok
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
    
    //그룹 호스트 수정 - U ---> ok 
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
    
    //그룹 삭제 - D ---> ok
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
