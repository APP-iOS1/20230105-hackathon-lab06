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
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    // 현재 10m이상 처음이랑 움직일
    @Published var preRegion = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    //@Published var preRegion: CLLocationCoordinate2D?
    @Published var groupRegion : [GroupAnootationItems] = []
    
    @Published var currentLat: Double = 0.0
    @Published var currentLng: Double = 0.0
    
    //창휘
    func getPinLocation(x: Double, y: Double) {
        groupRegion.append(GroupAnootationItems(coordinate: CLLocationCoordinate2D(latitude: x, longitude: y)))
    }
    
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
        
        print("위치: \(location.coordinate)")
        
        // 거리가 10m 이상 떨어지면 위치 업데이트
        if calcDistance(lan1:location.coordinate.latitude,
                        lng1: location.coordinate.longitude,
                        lan2: preRegion.latitude,
                        lng2: preRegion.longitude) < 10 {
            return
        }
        currentLat = location.coordinate.latitude
        currentLng = location.coordinate.longitude
        
        preRegion = location.coordinate
        
        DispatchQueue.main.async {
            self.lastSeenLocation = location
            
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
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
    
    func calcDistance(lan1: Double, lng1: Double, lan2: Double, lng2: Double) -> Int {
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
        
        return Int(distance * 1000)
        
    }
}
