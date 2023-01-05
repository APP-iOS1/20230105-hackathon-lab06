//
//  SignUpStep2View.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct SignUpStep2View: View {
    
    @Binding var navStack: NavigationPath
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SignUpStep2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStep2View(navStack: .constant(NavigationPath()), email: .constant(""), password: .constant(""))
    }
}
