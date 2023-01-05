//
//  SignUpView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var navStack: NavigationPath
    
    var body: some View {
        VStack {
            
            VStack {
                Text("회원가입")
            }
            .font(.largeTitle)
            .bold()
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView(navStack: .constant(NavigationPath()))
        }
    }
}
