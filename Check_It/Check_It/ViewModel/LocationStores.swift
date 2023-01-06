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
    
    @Published var location: Location = Location(
        locationName: "",
        address: "",
        detailAddress: "",
        latitude: 0.0,
        longitude: 0.0)
    
    
    func fetchLocation(_ locationId: String) async {
        let docRef = database.collection("Location").document(locationId)
        
        do {
            let document = try await docRef.getDocument()
            
            if document.exists {
                let docData = document.data()
                guard let docData else {
                    return
                }
                
                let locationName: String = docData["locationName"] as? String ?? ""
                let address: String = docData["address"] as? String ?? ""
                let detailAddress: String = docData["detailAddress"] as? String ?? ""
                let latitude: Double = docData["latitude"] as? Double ?? 0.0
                let longitude: Double = docData["longitude"] as? Double ?? 0.0
                
                let location = Location(locationName: locationName,
                                        address: address,
                                        detailAddress: detailAddress,
                                        latitude: latitude,
                                        longitude: longitude)
                // mainActor
                await MainActor.run(body: {
                    self.location = location
                })
                
                
                print("location: \(location)")
            }
        } catch {
            print("error: \(error)")
        }
    }
}
