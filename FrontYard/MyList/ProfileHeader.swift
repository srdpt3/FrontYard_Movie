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
            VStack {
                Text("\(followersCount)").font(.headline)
                Text("Followers").font(.subheadline)
            }.padding(10)
            VStack {
                Text("\(followingCount)").font(.headline)
                Text("Following").font(.subheadline)
            }.padding(10)
            Spacer()
        }
    }
}
