//
//  Settings.swift
//  FrontYard
//
//  Created by Dustin yang on 6/13/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import StoreKit
import MessageUI
import FirebaseAuth

struct SettingsView: View {
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    @Binding var isSettingsOpen: Bool
    @State  var showLoginView = false
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ZStack {
            
            Form {
                Section(header: Text("Feedback").foregroundColor(Color("Color2")).font(.subheadline).bold()) {
                    SectionButton(image: "star.circle.fill", label: "Rate this app", isShowingMailView: $isShowingMailView)
                    
                    SectionButton(image: "envelope.circle.fill", label: "Send feedback", isShowingMailView: $isShowingMailView)
                }
                
                Section(header: Text("About this app").foregroundColor(Color("Color2")).font(.subheadline).bold()) {
                    Text("This app is designed to help search movies. Using the app, you can watch trailers, read reviews and get movie info all from within the app").font(.caption)
                    Text("You can also follow users to share your favorite list").font(.caption)

                }
                
                Section(header: Text("Credit").foregroundColor(Color("Color2")).font(.subheadline).bold()) {
                    VStack(alignment: .leading, spacing: 10){
                        Text("The Movie Database (TMDb) API").font(.footnote)
                    }
                    
                    
                }
  
                
                Section(header: Text("Authentication").foregroundColor(Color("Color2")).font(.subheadline).bold()) {
                    //                    SectionButton(image: "emoji", label: "LogIn", showLoginView: $showLoginView)
                    
                    
                    Button(action: {
                        if(Auth.auth().currentUser != nil){
                            self.session.unbind()
                            self.session.logout()
                            
                        }else{
                            
                        }
                        self.showLoginView.toggle()
                        //                        print(Auth.auth().currentUser!.email)
                    }) {
                        HStack{
                            Image("login").resizable().frame(width: 30, height: 30)   .font(.title)
                            Text(Auth.auth().currentUser != nil ? "Logout" : "Login").foregroundColor(Color("Color2")).font(.subheadline).bold()
                            
                        }
                        
                    }
                    
                    
                }

                Section(header: Text("Developer").foregroundColor(Color("Color2")).font(.subheadline).bold()) {
                      VStack(alignment: .leading, spacing: 10){
                          
                          Button("Dustin Yang  - Github page") {UIApplication.shared.open(URL(string: "https://github.com/srdpt3")!)}
                          
                      }
                      
                      
                  }
                
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Button(action: {
                        self.isSettingsOpen.toggle()
                    }) {
                        Text("Dismiss")
                    }
                }
            }
            
            
            if (showLoginView) {
                LoginView(showLoginView: self.$showLoginView)
                    .transition(.move(edge: .bottom))
                    .animation(.default)
            }
            
            if (isShowingMailView) {
                mailView()
                    .transition(.move(edge: .bottom))
                    .animation(.default)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func mailView() -> some View {
        MFMailComposeViewController.canSendMail() ?
            AnyView(MailView(isShowing: $isShowingMailView, result: $result)) :
            AnyView(Text("Can't send emails from this device"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(isSettingsOpen: Binding.constant(true))
        }
    }
}

struct SectionButton: View {
    let image: String
    let label: String
    
    @Binding var isShowingMailView: Bool
    
    var body: some View {
        Button(action: buttonAction) {
            HStack {
                Image(systemName: image)
                    .font(.title)
                Text(label)
                    .foregroundColor(Color(.label))
            }
        }
    }
    
    func buttonAction() {
        if label == "Rate this app" {
            SKStoreReviewController.requestReview()
        } else {
            self.isShowingMailView.toggle()
        }
    }
}



//MARK: - Mail view
struct MailView: UIViewControllerRepresentable {
    
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        
        let emailSubjectText = "FrontYard Feedback"
        let emailText = "Please write your feedback here."
        let alertTitle = "Sign in to mail"
        let alertMessage = "You are currently not signed into the email application on your iOS device. Please sign in if you wish to send us feedback."
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = context.coordinator
        
        if MFMailComposeViewController.canSendMail() {
            composeVC.setToRecipients(["srdpt3@gmail.com"])
            composeVC.setSubject(emailSubjectText)
            composeVC.setMessageBody(emailText, isHTML: false)
        } else {
            let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(OKAction)
            UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion:nil)
        }
        
        return composeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}

