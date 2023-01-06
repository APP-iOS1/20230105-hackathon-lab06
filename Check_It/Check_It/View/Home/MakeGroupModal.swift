//
//  MakeGroup.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import SwiftUI
import UIKit
import Firebase

struct MakeGroupModal: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var userObj: SignUpViewModel
    @ObservedObject var storage = StorageViewModel()
    @State var isShowImagePicker = false
    @State var groupName: String = ""
    @State var host: String = ""
    @State var pickedImage: UIImage?
    @StateObject var groupStore: GroupStore = GroupStore()
    let nowUser = Auth.auth()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            if pickedImage == nil{
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: .infinity, height: 100)
                .overlay {
                    Button(action: {
                        isShowImagePicker.toggle()
                    }){
                        Text("그룹 이미지를 선택하세요")
                            .foregroundColor(.white)
                    }
                }
            }
            
            if let pickedImage = pickedImage {
                Image(uiImage: pickedImage).resizable()
                .frame(width: 100, height: 100)
                
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
                
                Button(action: {
                    let codes: String = String(Int.random(in: 100000..<1000000))
                    let tmpGroup = Group(groupName: groupName, groupImage: "이미지", host: host, code: codes, userList: [], promiseList: [])
                    let target = tmpGroup.id
                    let userIds = nowUser.currentUser?.uid
                    
                    
                    userObj.updateUserId(groupName: target, user: userObj.currentUser ?? User(id: "", userEmail: "", userImg: "", userName: "", groups: [""], promises: [""]), id: userIds ?? "")
 
                    print(userObj.currentUser?.groups)

                    
                    
                    //비동기 구현 필요
                    storage.uploadImageToStorage(userId: "test", image: pickedImage){url, err in
                        if let err = err {
                            print(err)
                            return
                        }
                        print(url)
                        
                        
                    }
//                    Task{
//                        await storage.downloadImageURL(userId: "test")
//                    }
//                    print("\(storage.url)")
                    dismiss()
                    
                }){
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
            
        } // - VStack
        .sheet(isPresented: $isShowImagePicker) {
            ImagePicker(sourceType: .photoLibrary){ image in
                self.pickedImage = image
            }
        }
        .presentationDragIndicator(.visible)
        .padding(.horizontal, 30)
    }
}

//struct MakeGroupModal_Previews: PreviewProvider {
//    static var previews: some View {
//        MakeGroupModal(groupName: "", groupStore: GroupStore())
//    }
//}
