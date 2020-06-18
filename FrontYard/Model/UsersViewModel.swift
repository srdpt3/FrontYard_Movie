//
//  UsersViewModel.swift
//  FrontYard
//
//  Created by Dustin yang on 6/17/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    var searchText: String = ""
    
    func searchTextDidChange() {
        isLoading = true
        //Api.User.searchUsers(text: searchText)
        UserApi().searchUsers(text: searchText) { (users) in
            self.isLoading = false
            self.users = users
        }
    }
}


class UserApi {
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
    
//    func loadPosts(userId: String, onSuccess: @escaping(_ posts: [Post]) -> Void) {
//         Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").getDocuments { (snapshot, error) in
//             
//             guard let snap = snapshot else {
//                 print("Error fetching data")
//                 return
//             }
//             var posts = [Post]()
//             for document in snap.documents {
//                 let dict = document.data()
//                 guard let decoderPost = try? Post.init(fromDictionary: dict) else {return}
//
//                 posts.append(decoderPost)
//             }
//             onSuccess(posts)
//         }
//     }
}
