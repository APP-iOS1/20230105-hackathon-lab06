//
//  Check_ItApp.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import SwiftUI

import SwiftUI
import FirebaseCore
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct Check_ItApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
                ContentView()
//            LoginView()
                .environmentObject(SignUpViewModel())
        }
    }
}

