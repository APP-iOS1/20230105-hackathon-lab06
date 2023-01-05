//
//  MakeGroup.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import SwiftUI


struct MakeGroupModal: View {
    @State var groupName: String = ""
    @State var host: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: .infinity, height: 100)
                .overlay {
                    Button(action: {}){
                        Text("그룹 이미지를 선택하세요")
                            .foregroundColor(.white)
                    }
                }
            Spacer().frame(height: 20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("myYellow"), lineWidth: 2)
                    .frame(width: .infinity, height: 200)
                VStack {
                    HStack {
                        Text("모임 기본정보")
                            .font(.title3)
                            .padding(.top, 7)
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 0.4)
                            .padding(.top, 25)
                        TextField("모임 이름을 입력해주세요.", text: $groupName)
                            .frame(width: 300)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer().frame(height: 25)
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 0.4)
                            .padding(.top, 25)
                        TextField("방장 이름을 입력해주세요.", text: $host)
                            .frame(width: 300)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer().frame(height: 30)
            
            VStack(alignment: .leading) {
                Text("📌 모임 시간 10분 전부터 출석이 가능합니다")
                    .font(.subheadline)
                
                Spacer().frame(height: 20)
                
                Text("📌 약속장소로부터 사용자가 지정한 거리내에 있어야 출석이 가능합니다")
                    .font(.subheadline)
                
                Spacer().frame(height: 20)
                
                Text("📌 호스트는 모임의 지각 기준 시간을 정할 수 있습니다")
                    .font(.subheadline)
                
                Spacer().frame(height: 20)
                
                Text("📌 호스트는 모임의 결석 기준 시간을 정할 수 있습니다.")
                    .font(.subheadline)
                
                Spacer().frame(height: 30)
                
                Button(action: {}){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("melon"))
                        .frame(width: .infinity, height: 60)
                        .overlay {
                            Text("모임 개설하기")
                                .font(.title3)
                                .foregroundColor(.white)
                                .bold()
                        }
                }
            }
            
        }
        .presentationDragIndicator(.visible)
        .padding(.horizontal, 30)
    }
}

struct MakeGroupModal_Previews: PreviewProvider {
    static var previews: some View {
        MakeGroupModal(groupName: "")
    }
}
