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
   var user: User
    var body: some View {
        HStack {
            
//
            AnimatedImage(url: URL(string: user.profileImageUrl)).resizable().frame(width: 80, height: 80).padding(.leading, 20).aspectRatio(contentMode: .fill) .clipShape(Circle())
         
            Spacer()
            VStack {
                Text("50").font(.headline)
                Text("asdfa").font(.subheadline)
            }.padding(10)
            VStack {
                Text("2").font(.headline)
                Text("Followers").font(.subheadline)
            }.padding(10)
            VStack {
                Text("5").font(.headline)
                Text("Following").font(.subheadline)
            }.padding(10)
            Spacer()
        }
    }
}
