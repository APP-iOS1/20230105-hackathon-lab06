//
//  Tab3MainView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct MyMainView: View {
    @State private var useAgreementSheet: Bool = false
    @State private var premiumRateSheet: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                            // MARK: - 사용자 이름 데이터 받아오기
                            Text("반갑습니다,\n---님")
                                .font(.largeTitle).bold()
                                .padding(.bottom, 20)
            
                            Spacer()
                        }
            .padding([.top, .leading, .trailing], 35)
            
            Spacer()
            
            VStack {
                
                Image("onejang")
                    .resizable()
                    .frame(width: 105, height: 105)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                
                // MARK: - 사용자 이메일 데이터 받아오기
                Text("\("text@naver.com")")
                    .font(.body)
                    .foregroundColor(.black)
                
                Button {
                    print("dd")
                } label: {
                        // MARK: - 프로필 사진 데이터 받아오기
                        Text("프로필 편집")
                            .foregroundColor(.white).bold()
                            .frame(width: 260, height: 50)
                            .background(Color.melon)
                            .cornerRadius(15)
                }
                
            } // VStack
            .frame(width: 330, height: 250)
            .background(Color.lightGray)
            .cornerRadius(15)
            
            Spacer()
            
            List {
                
                HStack {
                    Button {
                        useAgreementSheet.toggle()
                    } label: {
                        HStack {
                            Text("약관 및 정책")
                                .font(.title3).bold()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }.sheet(isPresented: $useAgreementSheet) {
                            useAgreementView()
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
                HStack {
                    Button {
                        premiumRateSheet.toggle()
                    } label: {
                        HStack {
                            Text("프리미엄 요금제 알아보기")
                                .font(.title3).bold()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }.sheet(isPresented: $premiumRateSheet) {
                        premiumRateView()
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
                HStack {
                    Button {
                        print("dd")
                    } label: {
                        HStack {
                            Text("로그아웃")
                                .font(.title3).bold()
                                .foregroundColor(.mediumGray)
                            
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
                            Text("회원탈퇴")
                                .font(.title3).bold()
                                .foregroundColor(.mediumGray)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom)
                
            }
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        
    }
}


struct MyMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyMainView()
    }
}
