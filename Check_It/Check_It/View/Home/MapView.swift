//
//  MapView.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/06.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @StateObject var locationStores = LocationStores()
    
    @State private var isQrcode: Bool = false // 바코드 유무
    
    var promisse: Promise = Promise(promiseName: "",
                                    limit: "",
                                    lateLimit: "",
                                    rangeLimit: 100,
                                    location: "UXr8dT6TP9YTYw1UCn65",
                                    date: "",
                                    startTime: "",
                                    endTime: "")
    
    // 임시로 만든 위치(실제로는 모임장소의 위도 경도가 들어감)
    var sampleLocation: CLLocationCoordinate2D =  CLLocationCoordinate2D(latitude: 37.478846, longitude: 126.620930)
    
    var distance: Int { // 두 지점사이의 거리를 나타냄
        let dis = locationViewModel.calcDistance(
            lan1: locationStores.location.latitude,
            lng1: locationStores.location.longitude,
            lan2: locationViewModel.currentLat,
            lng2: locationViewModel.currentLng)
        return dis
    }
    
    var stringsDis: String {
        if distance > 1 { // 1보다 크면 km단위
            let strings = String(distance)
            let distanceStr = strings.components(separatedBy: ".")
            let km = distanceStr.first ?? "0"
            return "\(km)"
        } else { // Meter 단위
            return "\(distance)"
        }
    }
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Map(coordinateRegion: $locationViewModel.region, showsUserLocation: true, annotationItems: locationViewModel.groupRegion) { item in
                    MapAnnotation(coordinate: item.coordinate) {
                        //Size per kilometer or any unit, just change the converted unit.
                        let kilometerSize = (geo.size.height/locationViewModel.region.spanLatitude.converted(to: .kilometers).value)
                        ZStack {
                            Circle()
                                .fill(Color.red.opacity(0.5))
                            //Keep it a circle
                                .frame(width: kilometerSize * 0.1, height: kilometerSize * 0.1)
                        }
                    }
                }
            }
            .frame(minWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.7)
            
            Spacer()
            
            if promisse.rangeLimit < distance {
                notPossibleButton
            } else {
                possibleButton
            }
            
            Spacer()
        }
        .onAppear {
            Task {
                await locationStores.fetchLocation(promisse.location)
                print("위치들: \(locationStores.location.latitude)")
                locationViewModel.getPinLocation(
                    x: locationStores.location.latitude,
                    y: locationStores.location.longitude
                )
            }
        }
        
        .edgesIgnoringSafeArea([.top, .leading, .trailing])
        
        .toolbar {
            ToolbarItem {
                Button(action: {
                    isQrcode.toggle()
                    print("큐알코드 클릭함")
                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                        
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color.black)
                    }
                })
                .sheet(isPresented: $isQrcode) {
                    QRView()
                        .presentationDetents([.medium])
                }
            }
        }
    }
    
    private var notPossibleButton: some View {
        Button(action: {
            // no to do
        }, label: {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.lightGray)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
                    .cornerRadius(10)
                Text("\(distance)m 떨어져 있습니다.")
                    .foregroundColor(.white)
                    .bold()
            }
        })
        .disabled(true)
        .padding(.horizontal, 30)
    }
    
    private var possibleButton: some View {
        Button(action: {
            // 출석하기 버튼 동작 수행
        }, label: {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("melon"))
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
                    .cornerRadius(10)
                Text("출석하기")
                    .foregroundColor(.white)
                    .bold()
            }
        })
        .padding(.horizontal, 30)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationViewModel())
    }
}
