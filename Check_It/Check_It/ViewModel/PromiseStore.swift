//
//  PromiseStore.swift
//  Check_It
//
//  Created by 차소민 on 2023/01/06.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase

class PromiseStore: ObservableObject {
    
    let database = Firestore.firestore()
    var promiseId: String = ""
    @Published var promise: [Promise]
    
    init() {
        promise = []
    }
    
    func fetchPromise(){
        database.collection("Promise")
            .getDocuments { (snapshot, error) in
                self.promise.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        
                        let docData = document.data()
                        let promiseName: String = docData["promiseName"] as? String ?? ""
                        let limit: String = docData["limit"] as? String ?? ""
                        let lateLimit: String = docData["lateLimit"] as? String ?? ""
//                        let rangeLimit: Int = docData["rangeLimit"] as? Int ?? 0
//                        let location: Location = docData["location"] as? Location ?? Location(from: )//?
                        let date: String = docData["date"] as? String ?? ""
                        let startTime: String = docData["startTime"] as? String ?? ""
                        let endTime: String = docData["endTime"] as? String ?? ""
                        
                        
                        
                        let promise: Promise = Promise(promiseName: promiseName, limit: limit, lateLimit: lateLimit, date: date, startTime: startTime, endTime: endTime)
                        
                        self.promise.append(promise)
                    }
                }
            }
    }
    
    func addPromise(_ promise: Promise){
        database.collection("Promise").document(promise.id)
            .setData(["promiseName": promise.promiseName,
                      "limit": promise.limit,
                      "lateLimit": promise.lateLimit,
                      "date": promise.date,
                      "startTime": promise.startTime,
                      "endTime": promise.endTime
                     ])
        fetchPromise()
    }
    
}