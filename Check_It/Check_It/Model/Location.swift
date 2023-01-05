//
//  Location.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Location: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var locationName: String
    var address: String
    var detailAddress: String
    
    var geoPoint: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}


