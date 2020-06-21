//
//  UsersView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/17/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct UsersView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    
    
    var body: some View {
        VStack {
            SearchBar(text: $usersViewModel.searchText, onSearchButtonChanged: usersViewModel.searchTextDidChange)
            
            List {
                if !usersViewModel.isLoading {
                    
                    ForEach(usersViewModel.users, id: \.uid) { user in
                        NavigationLink(destination: UserProfileView(user: user)) {
                            HStack {
                                
                                
                                AnimatedImage(url: URL(string: user.profileImageUrl)).resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill) .clipShape(Circle()).padding(.leading, 5)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(user.username).font(.headline).bold()
//                                    Text("IOS Developer").font(.subheadline)
                                }
                                
                            }.padding(10)
                        }
                    }
                }
                
                
            }
        }.navigationBarTitle(Text("Search"), displayMode: .inline)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
