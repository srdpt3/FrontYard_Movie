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
    
//    func searchFollowerUsers(userId: String) {
//        isLoading = true
//        //Api.User.searchUsers(text: searchText)
//        UserApi().searchFollowingUser(userId: userId) { (users) in
//            self.isLoading = false
//            self.users = users
//            print(self.users.count)
//        }
//    }
}


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
        
        //        Ref.FIRESTORE_COLLECTION_FOLLOWERS_USERID(userId: userId).getDocuments { (snapshot, error) in
        //
        //
        //            for document in snapshot!.documents {
        //                let dict = document.data()
        //
        //                guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
        //
        //                print("searchFollowingUser \(decoderUser)")
        //
        //                if decoderUser.uid != Auth.auth().currentUser!.uid {
        //                    users.append(decoderUser)
        //                }
        //
        //            }
        //            onSuccess(users)
        //
        //        }
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
