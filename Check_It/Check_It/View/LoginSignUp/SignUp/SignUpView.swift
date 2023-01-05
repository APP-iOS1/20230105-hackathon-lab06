//
//  SignUpView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            
            VStack {
                Image(systemName: "checkmark")

                
                Text("Check It !")
            }
            .font(.largeTitle)
            .bold()
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
