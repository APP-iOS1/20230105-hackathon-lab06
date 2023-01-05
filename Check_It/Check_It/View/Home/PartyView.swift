//
//  PartyView.swift
//  QRView
//
//  Created by 조현호 on 2023/01/05.
//

import SwiftUI

struct PartyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 40)
                        .cornerRadius(10)
                    Text("D-day")
                        .bold()
                        .foregroundColor(Color("myYellow"))
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 40)
                        .cornerRadius(10)
                    Text("D-23")
                        .bold()
                        .foregroundColor(Color("mediumGray"))
                }
            }
            
            .padding(.bottom, 10)
            
            
            
            Text("허니미니의 또구 동아리")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text("신촌 베이스볼클럽")
            }
            .padding(.bottom, 5)
            HStack {
                Image(systemName: "calendar")
                Text("3월 24일")
            }
            .padding(.bottom, 5)
            HStack {
                Image(systemName: "clock")
                Text("오후 3:00 ~ 오후 7:00")
            }
            .padding(.bottom, 5)
            
            Image("baseball")
                .resizable()
                .frame(width: 250,height: 150)
                .padding(.bottom, 20)
            
            Button {
                
            } label: {
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
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}
