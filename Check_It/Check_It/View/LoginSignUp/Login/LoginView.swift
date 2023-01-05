//
//  LoginView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI
import AlertToast
import Firebase

struct LoginView: View {
    
    @Binding var isFirstLaunching: Bool
    
    @EnvironmentObject private var signupViewModel: SignUpViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var signUpViewModel: SignUpViewModel

    @State var email = ""
    @State var password = ""
    @FocusState var isInFocusEmail: Bool
    @FocusState var isInFocusPassword: Bool
    @State private var isLoggedInFailed = false
    
    @State private var showBlankAlert: Bool = false


    
    @State var navStack = NavigationPath()
    
    //MARK: - 로그인 함수
    private func logInWithEmailPassword() {
        Task {
            await signUpViewModel.requestUserLogin(withEmail: email, withPassword: password)
            
            if signUpViewModel.currentUser?.userEmail != nil {
                isLoggedInFailed = false
                dismiss()
                signupViewModel.fetchUserInfo(user: signupViewModel.currentUser!)
                isFirstLaunching.toggle()
                
                print("로그인 성공 - 이메일: \(signUpViewModel.currentUser?.userEmail ?? "???")")
            } else {
                isLoggedInFailed = true
                print("로그인 실패")
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navStack) {
            VStack {
                Spacer()
                
                VStack(alignment: .center) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                    
                    Text("Check It !")
                }
                .padding()
                .font(.largeTitle)
                .bold()
                
                Spacer()
                
                // MARK: - 이메일 입력
                VStack {
                    
                    HStack {
                        Text("이메일")
                            .bold()
                            .padding(.trailing, -8)
                        
                        Text("을 입력해주세요")
                        Spacer()
                    }
                    .padding(.leading, 35)
                    .padding(.bottom, 3)
                    .font(.title3)
                    
                    HStack(alignment: .center) {
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .opacity(0.1)
                            .frame(width: 300, height: 50)
                            .overlay(
                                HStack {
                                    TextField("이메일", text: $email)
                                        .padding()
                                }
                            )
                    }
                }
                .padding()
                
                // MARK: - 비밀번호 입력
                VStack {
                    
                    HStack {
                        Text("비밀번호")
                            .bold()
                            .padding(.trailing, -8)
                        
                        Text("를 입력해주세요")
                        Spacer()
                    }
                    .padding(.leading, 35)
                    .padding(.bottom, 3)
                    .font(.title3)
                    
                    HStack(alignment: .center) {
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .opacity(0.1)
                            .frame(width: 300, height: 50)
                            .overlay(
                                HStack {
                                    SecureField("비밀번호", text: $password)
                                        .padding()
                                }
                            )
                    }
                }
                .padding(.horizontal)
                
                HStack() {
                    
                    NavigationLink(value: "") {
                        Text("회원가입")
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }
                    .navigationDestination(for: String.self) { value in
                        
                        SignUpView(navStack: $navStack)
                    }
                    .navigationBarBackButtonHidden(true)
                    
                    
                }
                .padding()
                
                
                
                Spacer()
                Spacer()
                
                Divider()
                
                Button {
                    logInWithEmailPassword()
                    
                } label: {
                    Text("로그인")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }
                .padding()
                
            } // VStack
            .onTapGesture() {
                
            }
            .toast(isPresenting: $showBlankAlert) {
                AlertToast(type: .image("Signed"
                                        , .white), title: "로그인 완료", subTitle: "환영합니다")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    @Binding var isFirstLaunching: Bool
    
    static var previews: some View {
        LoginView(isFirstLaunching: .constant(false))
            .environmentObject(SignUpViewModel())
    }
}
