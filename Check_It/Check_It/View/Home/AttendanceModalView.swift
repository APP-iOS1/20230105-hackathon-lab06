//
//  AttendanceModalView.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/05.
//

import SwiftUI
import MapKit

struct AttendanceModalView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        makeView()
    }
    
    @ViewBuilder
    func makeView() -> some View{
        switch locationViewModel.authorizationStatus {
        case .notDetermined:
            RequestLocationView()
                .environmentObject(locationViewModel)
        case .restricted:
            ErrorView(errorText: "위치 권한이 제한되었습니다.")
            //TODO: - 현재 화면에서 뒤로가고 다시 권한을 요청해야함
            // 뒤로가기 (모달이니 모달을 종료하면 될듯)
        case .denied:
            ErrorView(errorText: "위치 권한이 거부되었습니다 권한을 허용해 주세요.")
            //TODO: - 현재 화면에서 뒤로가고 다시 권한을 요청해야함
            // 뒤로가기 (모달이니 모달을 종료하면 될듯)
        case .authorizedAlways, .authorizedWhenInUse:
            MapView()
                .environmentObject(locationViewModel)
        default:
            Text("Unexpected status")
        }
    }
}

// MARK: - 위치를 요청하는 뷰
struct RequestLocationView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "location.circle")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Button(action: {
                print("위치 요청")
                locationViewModel.requestPermission()
            }, label: {
                Label("위치를 요청합니다.", systemImage: "location")
            })
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("만남 장소와의 거리를 계산하기 위해 위치를 요청합니다.")
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

// MARK: - 에러 메시지 뷰
struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(errorText)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
    }
}

struct AttendanceModalView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceModalView()
    }
}
