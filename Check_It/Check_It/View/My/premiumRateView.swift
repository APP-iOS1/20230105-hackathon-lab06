//
//  premiumRateView.swift
//  Check_It
//
//  Created by 황예리 on 2023/01/06.
//

import SwiftUI

struct premiumRateView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            VStack(alignment: .center, spacing: 15) {
                Image("CheckItLogo")
                    .resizable()
                    .frame(width: 280, height: 80)
                    .padding()
                
                HStack(spacing: 25) {
                    Text("Premium 요금제")
                        .font(.title2).bold()

                    
                    HStack(spacing: 1) {
                        Image(systemName: "wonsign")
                            .fontWeight(.semibold)
                            .font(.body)
                        
                        
                        Text("3,900 / 월")
                            .font(.title2).bold()
                    }
                    .foregroundColor(.myRed)
                }
                
                
                Text("최대 인원 수의 제한 해제,광고 제거, Custom QR Code,Custom MapPin, 등의 서비스를 제공합니다.")
                    .font(.body)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("최대 인원 8명")
                    .font(.body)
                    .foregroundColor(.mediumGray)
                
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.myYellow)
                    
                    Text("최대 인원 무제한")
                        .foregroundColor(.melon)
                }
                .font(.title2).bold()
                
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("광고 포함")
                    .font(.body)
                .foregroundColor(.mediumGray)
                
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.myYellow)

                    
                    Text("광고 제거")
                        .foregroundColor(.melon)
                }
                .font(.title2).bold()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Basic QR Code")
                    .font(.body)
                    .foregroundColor(.mediumGray)
                
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.myYellow)
                    
                    
                    Text("Custom QR Code 제공")
                        .foregroundColor(.melon)
                }
                .font(.title2).bold()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Basic MapPin")
                    .font(.body)
                    .foregroundColor(.mediumGray)

                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.myYellow)

                    
                    Text("Custom MapPin 제공")
                        .foregroundColor(.melon)
                }
                .font(.title2).bold()
            }
            
            Spacer()
            
            Button(action: {}){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.melon)
                    .frame(width: .infinity, height: 60)
                    .overlay {
                        Text("결제하기")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                    }
            }
//            .padding(.vertical, 25)

            Spacer()
        }
        .padding(.horizontal, 35)
    }
}

struct premiumRateView_Previews: PreviewProvider {
    static var previews: some View {
        premiumRateView()
    }
}
