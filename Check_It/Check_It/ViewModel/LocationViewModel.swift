//
//  LocationViewModel.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/05.
//

import SwiftUI
import MapKit

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    
    @Published var region =  MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    @Published var preRegion = CLLocationCoordinate2D(latitude: 42.0522448, longitude: -102.0079053)
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        locationManager.startUpdatingLocation()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return }
        
        if location.coordinate.latitude == preRegion.latitude && location.coordinate.longitude == preRegion.longitude {
            return
        }
        // 거리가 10m 이상 떨어지면 위치 업데이트
        if calcDistance(lan1:location.coordinate.latitude,
                        lng1: location.coordinate.longitude,
                        lan2: preRegion.latitude,
                        lng2: preRegion.longitude) < 10 {
            return
        }
        
        preRegion = location.coordinate
        
        DispatchQueue.main.async {
            self.lastSeenLocation = location
            
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
        fetchCountryAndCity(for: locations.first)
    }

    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.currentPlacemark = placemarks?.first
        }
    }
    
    func calcDistance(lan1: Double, lng1: Double, lan2: Double, lng2: Double) -> Double {
        var distance: Double
        var radius: Double = 6371.0
        var radin = Double.pi / 180
        
        var deltaLatitude = abs(lan1 - lan2) * radin
        var deltaLongtitude = abs(lng1 - lng2) * radin
        
        var signDeltaLat = sin(deltaLatitude / 2)
        var signDeltaLng = sin(deltaLongtitude / 2)
        
        var squareRoot = sqrt(
            signDeltaLat * signDeltaLat + cos(lan1 * radin) * cos(lan2 * radin) * signDeltaLng * signDeltaLng
        )
        /// distance 결과는 km단위로 나옴
        distance = 2.0 * radius * asin(squareRoot)
        
        return distance * 1000
        
//        if distance > 1 {
//            let strings = String(distance)
//            let distanceStr = strings.components(separatedBy: ".")
//            let km = distanceStr.first ?? "0"
//            print("km: \(km)")
//
//            return "\(km)km"
//
//        } else {
//            let newDistance = Int(round(distance * 1000))
//            let strings = "\(newDistance)m"
//            print("m: \(strings)")
//
//            return strings
//        }
    }
}

