//
//  PartyView.swift
//  QRView
//
//  Created by 조현호 on 2023/01/05.
//

import SwiftUI

struct PartyView: View {
    @State var isChecked: Bool = false
    var body: some View {
        NavigationLink(destination: MainDetailView()) {
            VStack(alignment: .leading) {
                ddayFrame(day: "D-day")
                    .padding(.bottom, 10)
                
                Text("허니미니의 또구 동아리")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.black)
                    Text("신촌 베이스볼클럽")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                    Text("3월 24일")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.black)
                    Text("오후 3:00 ~ 오후 7:00")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 10)
                
                Image("baseball")
                    .resizable()
                    .frame(width: 250,height: 150)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AttendanceModalView()){
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("melon"))
                            .frame(width: 250, height: 50)
                            .cornerRadius(10)
                        Text("Check It !")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
            }
            .padding(30)
            .background(Color("lightGray"))
            .cornerRadius(10)
            .padding(.bottom, 40)
        }
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}
