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
