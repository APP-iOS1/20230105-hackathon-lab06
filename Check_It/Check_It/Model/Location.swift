//
//  Location.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Location: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var locationName: String // 약속장소명
    var address: String //주소
    var detailAddress: String //상세주소
    var latitude: Double
    var longitude: Double
//    var geoPoint: Coordinates // 좌표값(위도, 경도)
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}


