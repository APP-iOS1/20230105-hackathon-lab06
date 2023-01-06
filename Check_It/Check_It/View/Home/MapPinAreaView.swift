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
//    @State private var
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5490065, longitude: 126.9165782),
        span: MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001))

    var body: some View {
        VStack {
            GeometryReader{ geo in
                  Map(
                    coordinateRegion: $region, annotationItems: locationViewModel.groupRegion) { item in
                        MapAnnotation(coordinate: item.coordinate) {
                                  //Size per kilometer or any unit, just change the converted unit.
                                  let kilometerSize = (geo.size.height/region.spanLatitude.converted(to: .kilometers).value)
                            ZStack {
//                                Image(systemName: "mappin")
//                                    .resizable()
//                                    .frame(width: kilometerSize * 0.01, height: kilometerSize * 0.01)
                                Circle()
                                    .fill(Color.red.opacity(0.5))
                                //Keep it a circle
                                    .frame(width: kilometerSize * 0.02, height: kilometerSize * 0.02)
                                
                            }
                          }
                      }
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
extension MKCoordinateRegion{
    ///Identify the length of the span in meters north to south
    var spanLatitude: Measurement<UnitLength>{
        let loc1 = CLLocation(latitude: center.latitude - span.latitudeDelta * 0.5, longitude: center.longitude)
        let loc2 = CLLocation(latitude: center.latitude + span.latitudeDelta * 0.5, longitude: center.longitude)
        let metersInLatitude = loc1.distance(from: loc2)
        return Measurement(value: metersInLatitude, unit: UnitLength.meters)
    }
}
//VStack {
//    GeometryReader { geo in
//        Map(coordinateRegion: $region, annotationItems : locationViewModel.groupRegion) { location in
//            let ratio = (geo.size.height/region.spanLatitude.value)
//            let kiometerSize = ratio * 1000
//            ZStack {
//                Circle()
//                    .fill(Color.red.opacity(0.5))
//                    .frame(width: kiometerSize, height: kiometerSize)
//                MapMarker(coordinate: location.coordinate, tint: .red)
//            }
//        }
//    }
//}
