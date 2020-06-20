//
//  FollowUserView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/19/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FollowUserView: View {
    
    let users: [User]?
//    @Binding var isLoading : Bool
//    @Binding var error: NSError?
    //    var user: User?
    
    //    init(user: User) {
    //        print("called")
    //        followViewModel = FollowingModelView(userId: user.uid )
    //        //        followViewModel.searchFollowerUsers(userId: user.uid)
    //    }
    

    var body: some View {
        VStack {
            //            SearchBar(text: $usersViewModel.searchText, userId: "", onSearchButtonChanged: usersViewModel.searchTextDidChange)
            
            List {
//                if !self.isLoading {
                ForEach(self.users!, id: \.uid) { u in
                      NavigationLink(destination: UserProfileView(user: u)) {
                            HStack {
                                
                                AnimatedImage(url: URL(string: u.profileImageUrl)).resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill) .clipShape(Circle()).padding(.leading, 5)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(u.username).font(.headline).bold()
                                    Text("IOS Developer").font(.subheadline)
                                }
                                
                            }.padding(10)
                        }
                    
                }
                
                
            }
        }
        .navigationBarTitle(Text("Following"), displayMode: .inline).onAppear(){
            
        }
    }
}

struct followingMainView : View {
    
    @Binding var users: [User]
    @Binding var isLoading : Bool
    @Binding var error: NSError?
    var body: some View {
        VStack {
            //            SearchBar(text: $usersViewModel.searchText, userId: "", onSearchButtonChanged: usersViewModel.searchTextDidChange)
            
            List {
                if !self.isLoading {
                    ForEach(self.users, id: \.uid) { user in
                        NavigationLink(destination: UserProfileView(user: user)) {
                            HStack {
                                
                                AnimatedImage(url: URL(string: user.profileImageUrl)).resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill) .clipShape(Circle()).padding(.leading, 5)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(user.username).font(.headline).bold()
                                    Text("IOS Developer").font(.subheadline)
                                }
                                
                            }.padding(10)
                        }
                    }
                }
                
                
            }
        }
        .navigationBarTitle(Text("Following"), displayMode: .inline).onAppear(){
            
        }
    }
}

//struct FollowUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowUserView()
//    }
//}

