//
//  StorageViewModel.swift
//  Check_It
//
//  Created by sole on 2023/01/06.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

struct StorageView: View {
    @State var text: String = "IMG_9755.heic"
    @State var isShowImagePicker: Bool = false
    @State var image: UIImage?
    @State var url: String?
    var body: some View {
        VStack{
            
            AsyncImage(url:URL(string: url ?? ""), scale: 2.0){image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                Image(systemName: "paperplane.circle.fill")
                               .resizable()
                               .scaledToFit()
                               .frame(maxWidth: 200)
            }
                
                
            TextField("이미지 이름", text: $text)
            Button(action: { isShowImagePicker.toggle() }) {
                Text("이미지 피커")
            }
            
            Button(action: {uploadImageToStorage()}){
                Text("스토리지 업로드")
            }
            Button(action: {printDownloadData()}){
                Text("url 프린트 ")
            }
            if let image = image {
                Image(uiImage: image).resizable()
                .frame(width: 100, height: 100)
                
            }
        }
        .sheet(isPresented: $isShowImagePicker) {
            ImagePicker(sourceType: .photoLibrary){ image in
                self.image = image
            }
        }
    }
    
    func uploadImageToStorage() {
        let ref = Storage.storage().reference(withPath: "images/\(text)")
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else {return}
        ref.putData(imageData, metadata: nil){ metadata, err in
            if let err = err {
                print("업로드 실패")
                return
            }
            print("업로드 성공")
        }
        
    }
    func printDownloadData(){
        //uid/uuid 이런 방식?
        let ref = Storage.storage().reference(withPath: "images/\(text)")
        ref.downloadURL { url, err in
            if let err = err{
                print("다운로드 실패")
                print(err.localizedDescription)
                return
            }
            
            if let url = url {
                self.url = url.absoluteString
                print(url.absoluteString)
            }
        }
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView()
    }
}
