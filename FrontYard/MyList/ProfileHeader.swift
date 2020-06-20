//
//  ProfileHeader.swift
//  FrontYard
//
//  Created by Dustin yang on 6/16/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    
    var user: User?
    
    @Binding var followingUsers: [User]
    @Binding var followerUsers: [User]

    var movieCount: Int
    @Binding var followingCount: Int
    @Binding var followersCount: Int
    
    var body: some View {
        HStack {
            
            //
            AnimatedImage(url: URL(string: user!.profileImageUrl)).resizable().frame(width: 80, height: 80).aspectRatio(contentMode: .fill) .clipShape(Circle()).padding(.leading, 5)
            
            Spacer()
            VStack {
                Text("\(movieCount)").font(.headline)
                Text("movies").font(.subheadline)
            }.padding(10)
            

            NavigationLink(destination: LazyView {FollowUserView(users: self.followerUsers)}) {
                
                VStack {
                    Text("\(followersCount)").font(.headline)
                    Text("Follower").font(.subheadline)
                }.padding(10).foregroundColor(.black)
                
            }

            NavigationLink(destination: LazyView {FollowUserView(users: self.followingUsers)}) {
                VStack {
                    Text("\(followingCount)").font(.headline)
                    Text("Following").font(.subheadline)
                }.padding(10).foregroundColor(.black)

            }
            
            
            Spacer()
        }
    }
}

struct LazyView<Content: View>: View {
    var content: () -> Content
    var body: some View {
        self.content()
    }
}
