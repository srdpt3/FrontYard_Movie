//
//  UserApi.swift
//  FrontYard
//
//  Created by Dustin yang on 6/20/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth



class UserApi {
    
    func searchFollowingUser(userId: String, onSuccess: @escaping(_ users: [User]) -> Void) {
        Ref.FIRESTORE_COLLECTION_FOLLOWING(userId: userId).getDocuments { (snapshot, error) in
     var users = [User]()

            for document in snapshot!.documents {
                let dict = document.data()
                guard let decoderUser = try? User.init(fromDictionary: dict) else {return}

                if decoderUser.uid != Auth.auth().currentUser!.uid {
                    users.append(decoderUser)
                }
            }
            
            onSuccess(users)

        }

    }
    
    func searchFollowerUser(userId: String, onSuccess: @escaping(_ users: [User]) -> Void) {
         Ref.FIRESTORE_COLLECTION_FOLLOWERS(userId: userId).getDocuments { (snapshot, error) in
      var users = [User]()

             for document in snapshot!.documents {
                 let dict = document.data()
                 guard let decoderUser = try? User.init(fromDictionary: dict) else {return}

                 if decoderUser.uid != Auth.auth().currentUser!.uid {
                     users.append(decoderUser)
                 }
             }
             
             onSuccess(users)

         }

     }
    
    
    func searchUsers(text: String, onSuccess: @escaping(_ users: [User]) -> Void) {
        Ref.FIRESTORE_COLLECTION_USERS.whereField("keywords", arrayContains: text.lowercased()).getDocuments { (snapshot, error) in
            guard let snap = snapshot else {
                print("Error fetching data")
                return
            }
            print(snap.documents)
            var users = [User]()
            for document in snap.documents {
                let dict = document.data()
                guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
                if decoderUser.uid != Auth.auth().currentUser!.uid {
                    users.append(decoderUser)
                }
                
            }
            onSuccess(users)
        }
    }
    
    func loadPosts(userId: String, onSuccess: @escaping(_ posts: [MyList]) -> Void) {
        Ref.FIRESTORE_GET_MYLIST_USERID(userId: userId).getDocuments { (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error fetching data")
                return
            }
            var posts = [MyList]()
            for document in snap.documents {
                let dict = document.data()
                guard let decoderPost = try? MyList.init(fromDictionary: dict) else {return}
                
                posts.append(decoderPost)
            }
            onSuccess(posts)
        }
    }
}
