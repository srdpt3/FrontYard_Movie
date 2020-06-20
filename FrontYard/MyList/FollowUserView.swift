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
    var body: some View {
        VStack {
            
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
