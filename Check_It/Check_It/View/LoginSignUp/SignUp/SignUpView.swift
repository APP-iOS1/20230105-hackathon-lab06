//
//  SignUpView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var navStack: NavigationPath
    
    @State var email = ""
    @State var password = ""
    @State var passwordCheck = ""
    @FocusState var isInFocusEmail: Bool
    @FocusState var isInFocusPassword: Bool
    @FocusState var isInFocusPasswordCheck: Bool
    
    @State private var isSecuredPassword = true
    @State private var isDuplicated = false
    @State private var isNotDuplicated = false
    
    @State var isSignUpSucced = false
    
    // MARK: - 이메일 형식 인증
    /// 이메일 형식 abc@email.com 을 검증하는 함수입니다.
    
    func verifyEmailType(string: String) -> Bool {
        let emailFormula = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        return  NSPredicate(format: "SELF MATCHES %@", emailFormula).evaluate(with: string)
    }
    
    // MARK: - 비밀번호 형식 인증
    /// 비밀번호 형식을 검증하는 함수입니다.
    func verifyPasswordType(password: String) -> Bool {
        let passwordFormula = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,20}$"
        
        return password.range(of: passwordFormula, options: .regularExpression) != nil
    }
    
    // MARK: - 이메일 중복 검사
    /// 이메일 중복을 검사하는 함수입니다.
//    func verifyEmailDuplicated() {
//        Task {
//            if await signUpViewModel.isEmailDuplicated(currentUserEmail: email) {
//                isDuplicated = true
//                isNotDuplicated = false
//            } else {
//                isDuplicated = false
//                isNotDuplicated = true
//            }
//        }
//    }
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            HStack {
                Text("반가워요!")
                Spacer()
            }
            .font(.largeTitle)
            .bold()
            .padding()
        
            // MARK: - 이메일 입력
            VStack {
                HStack {
                    Text("이메일")
                        .font(.title2)
                        .bold()
                        .padding(.trailing, -8)
                    
                    Text("을 입력해 주세요")
                        .font(.title2)
                    
                    Spacer()
                }
                .padding(.bottom, -5)
                
                HStack() {
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .opacity(0.1)
                        .frame(width: 280, height: 40)
                        .overlay(
                            HStack {
                                TextField("이메일 (checkit@email.com)", text: $email)
                                    .padding()
                            }
                        )
                    
                    if !email.isEmpty && verifyEmailType(string: email) {
                        
                    }
                    
                    Spacer()
                } // HStack
            }
            .padding()
            
            // MARK: - 비밀번호 입력
            VStack {
                HStack {
                    Text("비밀번호")
                        .font(.title2)
                        .bold()
                        .padding(.trailing, -8)
                    
                    Text("를 입력해 주세요")
                        .font(.title2)
                    
                    Spacer()
                }
                .padding(.bottom, -5)

                
                HStack() {
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .opacity(0.1)
                        .frame(width: 280, height: 40)
                        .overlay(
                            HStack {
                                TextField("비밀번호를 입력해주세요", text: $password)
                                    .padding()
                            }
                        )
                    
                    Spacer()
                } // HStack
                .padding(.bottom, 30)
                
                HStack() {
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .opacity(0.1)
                        .frame(width: 280, height: 40)
                        .overlay(
                            HStack {
                                TextField("비밀번호를 한 번 더 입력해주세요", text: $passwordCheck)
                                    .padding()
                            }
                        )
                    
                    Spacer()
                } // HStack
            }
            .padding()
            
            Spacer()
            Spacer()
            
            Divider()
            
            NavigationLink {
                SignUpStep2View(navStack: $navStack, email: $email, password: $password)
            } label: {
                Text("다  음")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            } // NavigationLink - 다음
            // TextField가 비어있거나 비밀번호 2개가 다를 경우에는 "다음" 버튼 비활성화
//            .disabled(email.isEmpty || password.isEmpty || passwordCheck.isEmpty || password != passwordCheck || !checkEmailRule(string: email) || !checkPasswordRule(password: password) || signUpViewModel.emailDuplicationState != .notDuplicated ? true : false)
            .padding()
            
            
            
            
            
        } // VStack
    } // Body
} // View

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView(navStack: .constant(NavigationPath()))
        }
    }
}
