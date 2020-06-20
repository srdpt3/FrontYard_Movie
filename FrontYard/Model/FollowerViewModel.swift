//
//  FollowerViewModel.swift
//  FrontYard
//
//  Created by Dustin yang on 6/20/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SwiftUI
import FirebaseAuth


class FollowerViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: NSError?
    
    
    
    func searchFollowerUsers(userId: String) {
        isLoading = true
        //Api.User.searchUsers(text: searchText)
        UserApi().searchFollowerUser(userId: userId) { (users) in
            self.users = users
            print("searchFollowerUsers \(self.users.count)")
            
            
            self.isLoading = false
            
        }
    }
}
