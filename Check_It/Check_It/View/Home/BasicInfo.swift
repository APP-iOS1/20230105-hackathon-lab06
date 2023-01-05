//
//  BasicInfo.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import SwiftUI

struct BasicInfo: View {
    @Binding var groupName: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("모임 기본정보")
            ZStack {
                Rectangle()
                    .frame(width: 65, height: 0.4)
                    .padding(.top, 25)
                TextField("모임 이름을 입력해주세요.", text: $groupName)
                    .frame(width: 65)
            }
        }
        .frame(width: .infinity)
    }
}

//struct BasicInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicInfo(groupName: groupName)
//    }
//}
