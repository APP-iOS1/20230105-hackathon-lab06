//
//  DdayFrame.swift
//  Check_It
//
//  Created by 차소민 on 2023/01/05.
//

import SwiftUI

// 약속이 오늘이면
@ViewBuilder
func ddayFrame(day: String) -> some View{
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 60, height: 30)
        .foregroundColor(.white)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.myYellow, lineWidth: 1)
            Text("\(day)")
                .foregroundColor(.myYellow)
                .font(.caption.bold())
        }
}

// 약속이 오늘이 아니면
@ViewBuilder
func notTodayFrame(day: String) -> some View{
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 60, height: 30)
        .foregroundColor(.white)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mediumGray, lineWidth: 1)
            Text("\(day)")
                .foregroundColor(.mediumGray)
                .font(.caption.bold())
        }
}
