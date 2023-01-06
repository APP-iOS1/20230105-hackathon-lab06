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
    @Published var promises: [Promise] = []
    @Published var promise: Promise?
    
    init() {
        promises = []
    }
    
    func fetchPromiseDocument(promiseID: String){
        self.promise = nil
        
        
        database.collection("Promise").document("\(promiseID)")
            .getDocument {snapshot, error in
                if let error = error {
                    return
                }
                if let snapshot = snapshot {
                    let id: String = promiseID
                    let docData = snapshot
                    print("\(docData["date"])")
                    let promiseName: String = docData["promiseName"] as? String ?? ""
                    let limit: String = docData["limit"] as? String ?? ""
                    let lateLimit: String = docData["lateLimit"] as? String ?? ""
                    let rangeLimit: Int = docData["rangeLimit"] as? Int ?? 0
                    let location: String = docData["location"] as? String ?? ""
                    
                    let date: String = docData["date"] as? String ?? ""
                    let startTime: String = docData["startTime"] as? String ?? ""
                    let endTime: String = docData["endTime"] as? String ?? ""
                    
                    let promise: Promise = Promise(id: id, promiseName: promiseName, limit: limit, lateLimit: lateLimit, rangeLimit: rangeLimit, location: location, date: date, startTime: startTime, endTime: endTime)
                    
                    self.promise = promise
                    
                    print(promise)
                }
                
            }
    }

    func fetchPromise(){
        database.collection("Promise")
            .getDocuments { (snapshot, error) in
//                self.promise.removeAll()
                
                if let snapshot {
                    print("++++", self.promise)
                    var temp = [Promise]()
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        let promiseName: String = docData["promiseName"] as? String ?? ""
                        let limit: String = docData["limit"] as? String ?? ""
                        let lateLimit: String = docData["lateLimit"] as? String ?? ""
                        let rangeLimit: Int = docData["rangeLimit"] as? Int ?? 0
                        let location: String = docData["location"] as? String ?? ""
                        
                        let date: String = docData["date"] as? String ?? ""
                        let startTime: String = docData["startTime"] as? String ?? ""
                        let endTime: String = docData["endTime"] as? String ?? ""
                        
                        
                        
                        let promise: Promise = Promise(id: id, promiseName: promiseName, limit: limit, lateLimit: lateLimit, rangeLimit: rangeLimit, location: location, date: date, startTime: startTime, endTime: endTime)
                        
                        temp.append(promise)
                    }
                    print("++++", self.promise)
                    self.promises = temp
                }
            }
    }
    
    func addPromise(_ promise: Promise, group: Group){
        var inputPromiseList: [String] = group.promiseList
        inputPromiseList.append(promise.id)
        database.collection("Promise").document(promise.id)
            .setData(["id": "\(group.id)_\(promise.date)",
                      "promiseName": promise.promiseName,
                      "limit": promise.limit,
                      "lateLimit": promise.lateLimit,
                      "date": promise.date,
                      "startTime": promise.startTime,
                      "endTime": promise.endTime
                     ])
        
//        database.collection("Group").document(groupID)
//            .updateData([
//                      "promiseList": inputPromiseList
//                     ])

        fetchPromise()
    }
    
}
