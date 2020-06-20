//
//  FollowViewModel.swift
//  FrontYard
//
//  Created by Dustin yang on 6/17/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI


import Foundation
import SwiftUI

class FollowViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false

//    func searchFollowerUsers(userId: String) {
//        isLoading = true
//        //Api.User.searchUsers(text: searchText)
//        UserApi().searchFollowingUser(userId: userId) { (users) in
//            self.users = users
//            
//            
//            self.isLoading = false
//
//        }
//    }
//    @Published var isFollowing = false
    
//    func checkFollow(userId: String) {
//        Ref.FIRESTORE_COLLECTION_FOLLOWERS_USERID(userId: userId).getDocument { (document, error) in
//            if let doc = document, doc.exists {
//                self.isFollowing = true
//            } else {
//                self.isFollowing = false
//            }
//        }
//    }
    
//    func handleFollow(userId: String, isFollowing: Bool, followingCount_onSuccess: @escaping(_ followingCount: Int) -> Void, followersCount_onSuccess: @escaping(_ followersCount: Int) -> Void ) {
//        if !isFollowing {
//            follow(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
//        } else {
//            unfollow(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
//        }
//         
//    }
//    
    
    func follow(userId: String, user: User, followingCount_onSuccess: @escaping(_ followingCount: Int) -> Void, followersCount_onSuccess: @escaping(_ followersCount: Int) -> Void ) {
        
            guard let dict = try? user.toDictionary() else {return}
        
        Ref.FIRESTORE_COLLECTION_FOLLOWING_USERID(userId: userId).setData(dict) { (error) in
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
            }
        }
        
        Ref.FIRESTORE_COLLECTION_FOLLOWERS_USERID(userId: userId).setData(dict) { (error) in
            if error == nil {
                self.updateFollowCount(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
            }
        }
        
    }
    
    func unfollow(userId: String, followingCount_onSuccess: @escaping(_ followingCount: Int) -> Void, followersCount_onSuccess: @escaping(_ followersCount: Int) -> Void ) {
        Ref.FIRESTORE_COLLECTION_FOLLOWING_USERID(userId: userId).getDocument { (document, error) in
            if let doc = document, doc.exists {
                doc.reference.delete()
                self.updateFollowCount(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
            }
        }
        
        Ref.FIRESTORE_COLLECTION_FOLLOWERS_USERID(userId: userId).getDocument { (document, error) in
              if let doc = document, doc.exists {
                  doc.reference.delete()
                  self.updateFollowCount(userId: userId, followingCount_onSuccess: followingCount_onSuccess, followersCount_onSuccess: followersCount_onSuccess)
              }
          }
        
    }
    
    func updateFollowCount(userId: String, followingCount_onSuccess: @escaping(_ followingCount: Int) -> Void, followersCount_onSuccess: @escaping(_ followersCount: Int) -> Void  ) {
        Ref.FIRESTORE_COLLECTION_FOLLOWING(userId: userId).getDocuments { (snapshot, error) in
            
            if let doc = snapshot?.documents {
                followingCount_onSuccess(doc.count)
            }
        }
        
        Ref.FIRESTORE_COLLECTION_FOLLOWERS(userId: userId).getDocuments { (snapshot, error) in
             if let doc = snapshot?.documents {
                followersCount_onSuccess(doc.count)
             }
         }
    }
    
    
    
}
