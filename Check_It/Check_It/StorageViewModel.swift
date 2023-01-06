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
    @Published var userImageURL: String = ""
    
    func uploadImageToStorage(userId: String, image: UIImage?, completion: @escaping (String?, Error?) -> ()) {
        let ref = storage.reference(withPath: "\(userId)")
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {return}
        ref.putData(imageData, metadata: nil){ (_, err) in
            
            if let err = err {
                print("\(err)")
                return
            }
            
            ref.downloadURL { url, err in
                completion(url?.absoluteString, err)
            }
            
        }
        
        
    }
    
//    func uploadImageToStorage(userId: String, image: UIImage?,  completion: @escaping (String?, Error?) -> ()) {
//        let ref = storage.reference(withPath: "\(userId)")
//        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {return}
////        ref.putData(imageData, metadata: nil){ metadata, err in
////            completion(url, err)
////        }
//
//    }
    
//    func downloadImageURL(userId: String, completion: @escaping (String?, Error?) -> ())  {
//        let ref = storage.reference(withPath: "\(userId)")
//        let url: URL?
//        ref.downloadURL() { url, err in
//            completion(url, err)
//        }
            
            
        
//    }
    
    
    
}
