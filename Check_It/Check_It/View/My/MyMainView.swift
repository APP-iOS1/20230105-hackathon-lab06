//
//  Tab3MainView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct MyMainView: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .firstTextBaseline) {
                            // MARK: - 사용자 이름 데이터 받아오기
                            Text("반갑습니다,\n---님")
                                .font(.largeTitle).bold()
            
                            Spacer()
                            
                            // MARK: - 프로필 사진 데이터 받아오기
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 33, height: 33)
                        }
            .padding([.top, .leading, .trailing], 50)
            
            Spacer()
            
            VStack {
                
                Image("onejang")
                    .resizable()
                    .frame(width: 105, height: 105)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                
                // MARK: - 사용자 이메일 데이터 받아오기
                Text("text@naver")
                    .font(.body)
                    .foregroundColor(.black)
                
                Button {
                    print("dd")
                } label: {
                        Text("프로필 편집")
                            .foregroundColor(.white).bold()
                            .frame(width: 260, height: 50)
                            .background(Color.melon)
                            .cornerRadius(15)
                }
                
            } // VStack
            .frame(width: 300, height: 250)
            .background(Color.lightGray)
            .cornerRadius(15)
            
            Spacer()
            
            List {
                
                HStack {
                    Button {
                        print("dd")
                    } label: {
                        HStack {
                            Text("공지사항")
                                .font(.title3).bold()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
                HStack {
                    Button {
                        print("dd")
                    } label: {
                        HStack {
                            Text("약관 및 정책")
                                .font(.title3).bold()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
                HStack {
                    Button {
                        print("dd")
                    } label: {
                        HStack {
                            Text("프리미엄 요금제 알아보기")
                                .font(.title3).bold()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
            }
            .scrollContentBackground(.hidden)
            .frame(width: 360, height: 250)
            
            Spacer()
        }
        
    }
}


struct MyMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyMainView()
    }
}
