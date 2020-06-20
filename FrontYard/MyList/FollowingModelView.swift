//
//  FollowingModelView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/20/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import SwiftUI

class FollowingModelView: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: NSError?
    

    
    func searchFollowerUsers(userId: String) {
        isLoading = true
        //Api.User.searchUsers(text: searchText)
        UserApi().searchFollowingUser(userId: userId) { (users) in
            self.users = users
//            print("searchFollowingUser \(self.users.count)")
            
            
            self.isLoading = false
            
        }
    }
}


