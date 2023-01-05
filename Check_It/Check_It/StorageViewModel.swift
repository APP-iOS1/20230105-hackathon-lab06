//
//  StorageViewModel.swift
//  Check_It
//
//  Created by sole on 2023/01/06.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

class StorageViewModel: ObservableObject {
    let storage = Storage.storage()
    @Published var uesrImageURL: String = ""
    
    func uploadImageToStorage(userId: String, image: UIImage?) {
        let ref = storage.reference(withPath: "\(userId)")
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {return}
        ref.putData(imageData, metadata: nil){ metadata, err in
            if let err = err {
                print("업로드 실패")
                return
            }
            print("업로드 성공")
        }
        
    }
    
    func downloadImageURL(userId: String) {
        let ref = storage.reference(withPath: "\(userId)")
        ref.downloadURL { url, err in
            if let err = err{
                print("다운로드 실패")
                print(err.localizedDescription)
                return
            }
            
            if let url = url {
                self.uesrImageURL = url.absoluteString
                print(url.absoluteString)
            }
        }
    }
    
    
    
}
