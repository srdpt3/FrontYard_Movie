//
//  LoginView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var signinViewModel = SigninViewModel()
    @Binding  var showLoginView : Bool
    @State var showSignupView : Bool = false
    let universalSize = UIScreen.main.bounds
    @State var isAnimated = false
    func signIn() {
        
        signinViewModel.signin(email: signinViewModel.email, password: signinViewModel.password, completed: { (user) in
            print("login: \(user.email)")
            self.hide_keyboard()
            self.clean()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signinViewModel.showAlert = true
            self.signinViewModel.errorString = errorMessage
            
            
        }
        
    }
    
    func clean() {
        self.showLoginView.toggle()
        self.presentationMode.wrappedValue.dismiss()

        self.signinViewModel.email = ""
        self.signinViewModel.password = ""
        
    }
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
        
    }
    var body: some View {
        NavigationView {
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false){
                          VStack {
                                        //
                                        //                Group {
                                        Image("FrontYard").resizable().frame(width: 200, height: 50).aspectRatio(contentMode: .fit).padding(.bottom,10)
                                        //                    Text(TEXT_SIGNIN_HEADLINE).font(Font.title).padding(.bottom)
                                        //                    Text(TEXT_SIGNIN_SUBHEADLINE)
                                        //                        .font(.subheadline)
                                        //                        .foregroundColor(.gray)
                                        //                        .multilineTextAlignment(TextAlignment.center)
                                        //                }
                                        Divider()
                                        EmailTextField(email: $signinViewModel.email)
                                        PasswordTextField(password: $signinViewModel.password)
                                        SigninButton(action: signIn, label: TEXT_SIGN_IN).alert(isPresented: $signinViewModel.showAlert) {
                                            Alert(title: Text("Error"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK"), action: {
                                                
                                            }))
                                            
                                        }
                    //                    alert(isPresented: $signinViewModel.success){
                    //                        Alert(title: Text("Successfully Logged in"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("OK"), action: {
                    //
                    //                            //                        self.showLoginView.toggle()
                    //
                    //                        }))
                    //                    }
                                        
                                        //                    Divider()
                                        //                    NavigationLink(destination: SignUpView()) {
                                        //                        SignupText()
                                        //                    }
                                        
                                        
                                        Button(action: {
                                            self.showSignupView.toggle()
                                        }){
                                            HStack {
                                                Text(TEXT_NEED_AN_ACCOUNT).font(.footnote).foregroundColor(.gray)
                                                Text(TEXT_SIGN_UP).foregroundColor(Color("Color2"))
                                            }
                                        }
                                        
                                        
                                        //                }
                                        Spacer()
                                        Spacer()

                          }

                                        
                                        .sheet(isPresented: self.$showSignupView) {
                                            // ImagePickerController()
                                            //                                    LoginView(showLoginView: self.$showLoginView)
                                            SignUpView(showSignupView: self.$showSignupView, showSignInView: self.$showLoginView)
                                    }
                                    
                }    .edgesIgnoringSafeArea(.all).padding(.top, -20)
   
                
                getSinWave(interval: universalSize.width, amplitude: 130, baseline: -50 + universalSize.height/1.7)
                    .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                    .offset(x: isAnimated ? -1*universalSize.width : 0)
                    .animation(
                        Animation.linear(duration: 2)
                            .repeatForever(autoreverses: false)
                )
                getSinWave(interval: universalSize.width*1.2, amplitude: 130, baseline: 50 + universalSize.height/1.7)
                    .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                    .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
                    .animation(
                        Animation.linear(duration: 5)
                            .repeatForever(autoreverses: false)
                )
                Spacer()

            }.onAppear(){
                self.isAnimated = true
            }
        }.accentColor(Color.black)
        

    }
    func hide_keyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

