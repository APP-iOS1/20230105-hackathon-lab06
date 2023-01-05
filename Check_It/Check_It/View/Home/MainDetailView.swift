//
//  MainDetailView.swift
//  Check_It
//
//  Created by 차소민 on 2023/01/05.
//

import SwiftUI

struct MainDetailView: View {
    var body: some View {
        ScrollView {
            VStack{
                HStack {
                    VStack(alignment:.leading) {
                        // d-day면 ddayFrame, 아니면 notTodayFrame if문 추가하기
                        ddayFrame(day: "D-day") // 디데이 라벨
                            .padding(.bottom)
                        //notTodayFrame(day: "D-32")
                        Text("허미니의 또구 동아리") // 동아리 이름
                            .font(.title3.bold())
                            .padding(.bottom)
                        Image("")               // 동아리 이미지
                            .padding(.bottom)
                    }
                    Spacer()
                }
                .padding(.horizontal, 50)
                
                Divider()   // 동아리 이미지 넣어보고 이상하면 빼기
                    .padding(.bottom)
                
                HStack{
                    Text("일정 정보")
                        .font(.title3)
                    Spacer()
                    Button {
                        // 일정 추가하는 뷰
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 50)
                
                ForEach(0..<6) { i in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.lightGray)
                            .frame(width: 300, height:160)
                        HStack {
                            VStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 45, height: 25)
                                    .foregroundColor(.white)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.melon, lineWidth: 1)
                                        Text("출석")
                                            .foregroundColor(.melon)
                                            .font(.caption)
                                        // 출석이면 melon, 지각이면 myYellow, 결석이면 myRed
                                    }
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("3월 24일")              //날짜
                                }
                                .padding(.top, 5)

                                HStack{
                                    Image(systemName: "clock")
                                    Text("오후 3:00 - 오후 7:00")  //시간
                                }
                                .padding(.vertical, 5)

                                HStack{
                                    Image(systemName: "mappin.and.ellipse")
                                    Text("신촌 베이스볼클럽")        //위치
                                }
                                .padding(.bottom, 5)

                            }
                            Spacer()
                        }
                        .padding(.horizontal,70)
                    }
                }
                
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // 참여코드 공유
                } label: {
                    Text("초대하기")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MainDetailView()
            
        }
    }
}
