//
//  ProfileView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/16/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @ObservedObject private var profileViewModel = ProfileViewModel()
    @ObservedObject private  var followingViewModel = FollowingModelView()
    @ObservedObject private  var followerViewModel = FollowerViewModel()
    
    
    
    init() {
        self.profileViewModel.getUSerFromLocal()
        self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        
        self.followingViewModel.searchFollowingUsers(userId: profileViewModel.user.uid)
        self.followerViewModel.searchFollowerUsers(userId: profileViewModel.user.uid)
        
    }
    @State var selection = 0
    var displayState = ["square.grid.2x2.fill", "list.dash"]
    var body: some View {
        
        return
            NavigationView {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        
                        ProfileHeader(user: profileViewModel.user, followingUsers: $followingViewModel.users, followerUsers: $followerViewModel.users, movieCount: profileViewModel.posts.count, followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                        
                        
                                                EditProfileButton()
                        ProfileInformation(user: self.profileViewModel.user)
                        //
                        //                        Picker(selection: $selection, label: Text("Grid or Table")) {
                        //                            ForEach(0..<displayState.count) { index in
                        //                                Image(systemName: self.displayState[index]).tag(index)
                        //
                        //                            }
                        //                        }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                        if !profileViewModel.isLoading {
                            GridPosts(splitted: self.profileViewModel.splitted)
                            
                            
                        }

                        
                    }.padding(.top, 20)
                    
                }.navigationBarTitle( Text(self.profileViewModel.user.username).bold(), displayMode: .inline).navigationBarItems(leading:
                    Button(action: {}) {
                        NavigationLink(destination: UsersView()) {
                            Image(systemName: "person.fill").imageScale(Image.Scale.large).foregroundColor(.black)
                        }
                    }
                    
                    
                    //                    ,trailing:
                    //                   Button(action: {
                    //                       self.session.logout()
                    //
                    //                   }) {
                    //
                    //                       Image(systemName: "arrow.right.circle.fill").imageScale(Image.Scale.large).foregroundColor(.black)
                    //
                    //                   }
                    
                )  .onAppear {
                    self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
                    self.followingViewModel.searchFollowingUsers(userId: self.profileViewModel.user.uid)
                    self.followerViewModel.searchFollowerUsers(userId: self.profileViewModel.user.uid)
                    
                }
        }
        
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



struct EditProfileButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Edit Profile").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 30).background(Color.black)
            
        }.cornerRadius(5).padding(.leading, 20).padding(.trailing, 20)
    }
}

struct ProfileInformation: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(user.username) 's favorite list").bold()
        }.padding(.leading, 10)
    }
}


func saveUserLocally(mUserDictionary: NSDictionary) {
    print("SAved Locally")
    UserDefaults.standard.set(mUserDictionary, forKey: "currentUser")
    UserDefaults.standard.synchronize()
}


func resetDefaults() {
    print("resetDefaults")
    
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
        defaults.removeObject(forKey: key)
    }
}


