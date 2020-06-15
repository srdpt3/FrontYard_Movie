//
//  LoginView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var signinViewModel = SigninViewModel()
    @Binding  var showLoginView : Bool
    
    func signIn() {
        
        signinViewModel.signin(email: signinViewModel.email, password: signinViewModel.password, completed: { (user) in
            print("login: \(user.email)")

            self.clean()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signinViewModel.showAlert = true
            self.signinViewModel.errorString = errorMessage


        }
        
    }
    
    
    
    
    func clean() {
        self.showLoginView = false

        self.signinViewModel.email = ""
        self.signinViewModel.password = ""
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Group {
                    Image(IMAGE_LOGO).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                    Text(TEXT_SIGNIN_HEADLINE).font(Font.title).padding(.bottom)
                    Text(TEXT_SIGNIN_SUBHEADLINE)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(TextAlignment.center)
                }
                Spacer()
                Divider()
                EmailTextField(email: $signinViewModel.email)
                PasswordTextField(password: $signinViewModel.password)
                SigninButton(action: signIn, label: TEXT_SIGN_IN).alert(isPresented: $signinViewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK"), action: {
                        self.showLoginView.toggle()

                    }))

                }.alert(isPresented: $signinViewModel.success){
                    Alert(title: Text("GOOD"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK"), action: {
                                           self.showLoginView.toggle()

                                       }))
                }
                Divider()
                NavigationLink(destination: SignUpView()) {
                    SignupText()
                }
            }
        }.accentColor(Color.black)
        
        
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
