//
//  PartyView.swift
//  QRView
//
//  Created by 조현호 on 2023/01/05.
//

import SwiftUI

struct PartyView: View {
    @State var isChecked: Bool = false
    var promise: Promise
//    var group: Group
    
    let todayDateValue = Date().toString().toDate()
    let dateFormatter = DateFormatter()
    
//    let interval = promise.date.toDate()?.timeIntervalSince(todayDateValue ?? Date())
//    let days = Int((interval ?? 0) / 86400)
    
    var body: some View {
        NavigationLink(destination: MainDetailView(promise: promise)) {
            VStack(alignment: .leading) {
                if Int((promise.date.toDate()?.timeIntervalSince(todayDateValue ?? Date()) ?? 0) / 86400) == 0 {
                    ddayFrame(day: "D-day")
                        .padding(.bottom, 10)
                } else {
                    notTodayFrame(day: "D-\(Int(promise.date.toDate()?.timeIntervalSince(todayDateValue ?? Date()) ?? 0) / 86400)")
                        .padding(.bottom, 10)
                }
            
                
                Text("group.groupName")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.black)
                    Text("location.address")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                    Text(promise.date)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.black)
                    Text("\(promise.startTime) ~ \(promise.endTime)")
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

//struct PartyView_Previews: PreviewProvider {
//    static var previews: some View {
//        PartyView(promise: Promise(promiseName: "", limit: "", lateLimit: "", date: "", startTime: "", endTime: ""))
//    }
//}
