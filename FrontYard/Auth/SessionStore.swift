
//  SessionStore.swift
//  FrontYard
//
//  Created by Dustin yang on 6/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//


import Foundation
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published  var userSession: User?
    var handle: AuthStateDidChangeListenerHandle?
    func listenAuthenticationState() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
              print("listenAuthenticationState + \(user.uid)")
                
                
                
                
                
                Ref.FIRESTORE_DOCUMENT_USERID(userId:  user.uid).getDocument { (snapshot, error) in

                    guard let snapshot = snapshot else { return }

                    if snapshot.exists {
                        print("download current user from firestore")
                        saveUserLocally(mUserDictionary: snapshot.data()! as NSDictionary)
                        print( snapshot.data()! as NSDictionary)
                                            guard let user = try? User.init(_dictionary: (snapshot.data())! as NSDictionary) else {return}
                                            print(user)

                                            self.userSession = user
                    } else {
                        print("there is no user, save new in firestore")

                        //there is no user, save new in firestore
                   
//                        let user = User(_objectId: userId, _email: email, _firstName: "", _lastName: "")
//                        saveUserLocally(mUserDictionary: userDictionaryFrom(user: user))
//                        saveUserToFirestore(mUser: user)
                    }
                }

                
                
//
//
//
//                let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: user.uid)
//                  firestoreUserId.getDocument { (document, error) in
//                      if let dict = document?.data() {
//                        print(dict)
//                          guard let decoderUser = try? User.init(_dictionary: dict as NSDictionary) else {return}
//                        self.userSession = decoderUser
//                      }
//                  }
                self.isLoggedIn = true
                
                
                
                
            } else {
                print("isLoogedIn is false")
                self.isLoggedIn = false
                self.userSession = nil

            }
        })
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            
        } catch  {
            
        }
    }
    
    // stop listening for auth changes
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
