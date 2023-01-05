//
//  QRView.swift
//  Check_It
//
//  Created by 조현호 on 2023/01/05.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRView: View {
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("melon"), Color("myYellow")]),
                           startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // 각 로그인 한 ID 정보 넣어줘야 함
                Image(uiImage: generateQRCode(from: "사용자 정보"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
            }
        }
        .presentationDragIndicator(.visible)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
