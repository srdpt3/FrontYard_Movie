//
//  SignUpView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var signupViewModel = SignupViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var showSignupView : Bool
    @Binding var showSignInView : Bool

    func signUp() {
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print("SignUp \(user.email)")
            self.showSignInView.toggle()
            self.clean()
            // Switch to the Main App
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signupViewModel.showAlert = true
            self.signupViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean() {
        self.presentationMode.wrappedValue.dismiss()

        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    var body: some View {
        VStack {
            signupViewModel.image.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                .clipShape(Circle()).padding(.bottom, 10).padding(.top, 10)
                .onTapGesture {
                    print("Tapped")
                    self.signupViewModel.showImagePicker = true
            }
            UsernameTextField(username: $signupViewModel.username)
            EmailTextField(email: $signupViewModel.email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $signupViewModel.password)
                Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding([.leading])
            }
            SignupButton(action: signUp, label: TEXT_SIGN_UP).alert(isPresented: $signupViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
            }
            Divider()
            Text(TEXT_SIGNUP_NOTE).font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
            Spacer()

        }.sheet(isPresented: $signupViewModel.showImagePicker) {
           // ImagePickerController()
            ImagePicker(showImagePicker: self.$signupViewModel.showImagePicker, pickedImage: self.$signupViewModel.image, imageData: self.$signupViewModel.imageData)
        }
        .navigationBarTitle("Register", displayMode: .inline)
    }
}

