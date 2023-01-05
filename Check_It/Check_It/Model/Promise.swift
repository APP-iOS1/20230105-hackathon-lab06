//
//  Promise.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Promise: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var promiseName: String
    var limit: Int = 30
    var lateLimit: Int = 5
    var rangeLimit: Int
    var location: [Location]
}
