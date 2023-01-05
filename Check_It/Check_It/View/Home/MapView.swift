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
    
    @State private var isQrcode: Bool = false
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationViewModel.region, showsUserLocation: true)
                .frame(minWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.7)
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("출석하기")
                    .foregroundColor(.white)
                    .bold()
            })
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationViewModel())
    }
}
