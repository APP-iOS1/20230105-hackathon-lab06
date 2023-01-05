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
    
//    func addGroup(newGroup: Group) {
//        database.collection("Group")
//            .document("\(newGroup.id)")
//            .setData(["id": newGroup.id,
//                     ])
//    }
}
