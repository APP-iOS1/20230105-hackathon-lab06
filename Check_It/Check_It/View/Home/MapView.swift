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
    
    @State private var isQrcode: Bool = false // 바코드 유무
    
    var promisse: Promise = Promise(promiseName:,
                                    limit: <#T##String#>,
                                    lateLimit: <#T##String#>,
                                    date: <#T##String#>,
                                    startTime: <#T##String#>,
                                    endTime: <#T##String#>)
    
    // 임시로 만든 위치(실제로는 모임장소의 위도 경도가 들어감)
    var sampleLocation: CLLocationCoordinate2D =  CLLocationCoordinate2D(latitude: 37.478846, longitude: 126.620930)
    
    var sampleLimitDis: Int = 10 // 임시로 만든 제한 거리 단위는 m
    
    var distance: Int { // 두 지점사이의 거리를 나타냄
        let dis = locationViewModel.calcDistance(
            lan1: sampleLocation.latitude,
            lng1: sampleLocation.longitude,
            lan2: locationViewModel.region.center.latitude,
            lng2: locationViewModel.region.center.longitude)
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
            Map(coordinateRegion: $locationViewModel.region, showsUserLocation: true)
                .frame(minWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.7)
            
            Spacer()
            
            if sampleLimitDis < distance {
                notPossibleButton
            } else {
                possibleButton
            }
            
            Spacer()
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
