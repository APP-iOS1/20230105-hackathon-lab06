//
//  MapPinAreaView.swift
//  Check_It
//
//  Created by 류창휘 on 2023/01/06.
//

import SwiftUI
import MapKit

struct GroupAnootationItems: Identifiable {
    var coordinate : CLLocationCoordinate2D
    let id = UUID()
}
//126.9165782
struct MapPinAreaView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5490065, longitude: 126.9165782),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems : locationViewModel.groupRegion) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
        }
        .onAppear {
            GeoCodingService().getCoding(address: "서울 마포구 독막로3길 13") { value in
                locationViewModel.getPinLocation(x: Double(value[0]) ?? 0, y: Double(value[1]) ?? 0)
                print(value[0])
                print(value[1])
            }
        }
    }
}

struct MapPinAreaView_Previews: PreviewProvider {
    static var previews: some View {
        MapPinAreaView()
    }
}
