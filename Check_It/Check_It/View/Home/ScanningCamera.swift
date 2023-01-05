//
//  ScanningCamera.swift
//  Check_It
//
//  Created by 류창휘 on 2023/01/05.
//

import SwiftUI

struct ScanningCamera: View {
    @Binding var startScanning: Bool
    @Environment(\.presentationMode) var presentationMode
    
    @State var userID : String = ""
    @State var userNickname : String = ""
    @State var promiseId : String = ""

    var body: some View {
        NavigationView {
            ScanningCameraViewController(startScanning: $startScanning, userId: $userID, userNickname: $userNickname, promiseId: $promiseId)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("닫기")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
                .onAppear {
                    print("스캐닝카메라 온어피어")
                }
                .onDisappear {
                    print("스캐닝카메라 온디어피어")
                }
        }
    }
}

//struct ScanningCamera_Previews: PreviewProvider {
//    static var previews: some View {
//        ScanningCamera()
//    }
//}
