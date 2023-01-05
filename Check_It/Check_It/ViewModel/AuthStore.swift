//
//  AuthStore.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/06.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthStore: ObservableObject {
    let firebaseAuth = Auth.auth()
    let currentUser = Auth.auth().currentUser ?? nil
    
    let database = Firestore.firestore()
    
//    // 모임에 참가하는 함수
//    func joinGroup(
    
}
