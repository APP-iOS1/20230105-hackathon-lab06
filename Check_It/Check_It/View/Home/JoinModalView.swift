//
//  JoinModalView.swift
//  hackaton
//
//  Created by 조현호 on 2023/01/06.
//

import SwiftUI

struct JoinModalView: View {
    
    @State private var sharedCode: String = ""
    @State private var isJoined: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("모임 참가하기")
                    .font(.title.bold())
                Spacer()
            }
            TextField(
                "공유받은 코드를 입력해주세요",
                text: $sharedCode
            )
            .font(.title3)
            .foregroundColor(Color("mediumGray"))
            .padding()
            .background(Color("lightGray"))
            .frame(width:300)
            .padding(.bottom, 20)
            
            Button {
                isJoined.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("melon"))
                        .frame(width: 300, height: 60)
                        .cornerRadius(10)
                    Text("동아리 참가하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                
            }
        }
        .presentationDragIndicator(.visible)
    }
}

struct JoinModalView_Previews: PreviewProvider {
    static var previews: some View {
        JoinModalView()
    }
}
