//
//  LocationStores.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/06.
//

import Foundation
import FirebaseFirestore
import Firebase

// MARK: - Place에 Location id를 가지고 location을 가져오는 store

class LocationStores: ObservableObject {
    let database = Firestore.firestore()
    
//    @Published var location: Location = Location(
//        locationName: "",
//        address: "",
//        detailAddress: "",
//        geoPoint: ())
    
    
    func fetchLocation(_ locationId: String) {
        
        
        
    }
}
