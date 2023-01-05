//
//  AddScheduleView.swift
//  Check_It
//
//  Created by 차소민 on 2023/01/05.
//

import SwiftUI

struct AddScheduleView: View {
    @State var date: String = ""
    @State var startTime: String = ""
    @State var endTime: String = ""
    @State var place: String = ""
    
    @State var min: String = ""
    
    var body: some View {
        VStack(alignment:.center){
            HStack {
                Text("일정 추가하기")
                    .font(.title.bold())
                Spacer()
            }
            
            // 일정 정보
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: .infinity, height:180)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.myYellow, lineWidth: 1)
                    }
                HStack {
                    VStack(alignment:.leading){
                        Text("일정 정보")
                            .font(.title3)
                            .padding(.top,7)
                            
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.melon)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 0.4)
                                        .padding(.top,25)
                                    TextField("날짜", text: $date)
                                        .frame(width: 200)
                                }
                            }
                            .padding(.vertical,7)
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.melon)
                            ZStack {
                                Rectangle()
                                    .frame(width: 65, height: 0.4)
                                    .padding(.top,25)
                                TextField("시작 시간", text: $startTime)
                                    .frame(width: 65)
                            }
                            Text("~")
                            ZStack {
                                Rectangle()
                                    .frame(width: 65, height: 0.4)
                                    .padding(.top,25)
                                TextField("종료 시간", text: $endTime)
                                    .frame(width: 65)
                            }
                        }
                        .padding(.bottom,7)

                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.melon)
                            ZStack {
                                Rectangle()
                                    .frame(width: 200, height: 0.4) //같은 0.4인데 왜 다 달라보임?
                                    .padding(.top,25)
                                TextField("동아리 장소를 입력해주세요", text: $place)
                                    .frame(width: 200)
                            }

                        }
                        .padding(.bottom, 10)


                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            }
            .padding(.vertical)
            
            // 결석 기준 시간 정하기
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: .infinity, height:130)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.myYellow, lineWidth: 1)
                    }
                HStack {
                    VStack(alignment:.leading){
                        Text("결석 기준 시간 정하기")
                            .font(.title3)
                            .padding(.top,7)
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.melon)
                            HStack {
                                TextField("", text: $min)
                                    .frame(width: 68)
                                    .textFieldStyle(.roundedBorder)
                                Text("분 지나면 결석 처리하기!")
                            }
                            .padding(.vertical, 7)
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 20)

            }
            
            // 도움말?
            HStack {
                VStack(alignment: .leading){
                    Text("📌  동아리 최대 인원은 8명 입니다.")
                        .padding(.vertical, 5)
                    Text("📌  출석 인정 반경은 200m 입니다.")
                        .padding(.vertical, 5)
                    Text("📌  출석 인정 시간\n       : 10분전 ~ 시작 시간 정각까지 입니다.")
                        .padding(.vertical, 5)
                }
                .padding(.vertical, 25)
                Spacer()
            }
            .padding(.leading, 20)

            Spacer()    // 버튼을 맨 아래로 내리기? 
            
            // 일정 만들기 버튼
            Button {
                // 일정 만들기
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 60)
                    Text("일정 만들기")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
            }

        }
        //모든 뷰 맞춤 패딩
        .padding(.horizontal, 30)
//        .navigationTitle(Text("일정 추가하기")) // 타이틀로 주면 작아져서 위에 Text로 그냥 쌓음.
    }
}

struct AddScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddScheduleView()
        }
    }
}
