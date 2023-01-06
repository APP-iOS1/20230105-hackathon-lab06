//
//  AddressConvert.swift
//  Check_It
//
//  Created by sole on 2023/01/06.
//

import Foundation
struct AddressConvert {
    
    
    func getAddressLocation(address: String) -> [String]{
        var result: [String] = []
        
        // 도로명 주소를 위도 경도로 바꾸기
        var geocoding = GeoCodingService()
        geocoding.getCoding(address: address) { location in
            result = location
        }
        
        return result
    }
    
}
