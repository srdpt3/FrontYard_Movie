//
//  UserProfileView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/17/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    var user: User
    @ObservedObject var profileViewModel = ProfileViewModel()
    //    @ObservedObject private  var followViewModel = FollowingModelView()
    
    @State var selection = 0
    
    
    var displayState = ["square.grid.2x2.fill", "list.dash"]
    var body: some View {
        return
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {

                    HStack {
                        
                        //
                        AnimatedImage(url: URL(string:self.user.profileImageUrl)).resizable().frame(width: 80, height: 80).aspectRatio(contentMode: .fill) .clipShape(Circle()).padding(.leading, 5)
                        
                        Spacer()
                        VStack {
                            Text("\( self.profileViewModel.posts.count)").font(.headline)
                            Text("movies").font(.subheadline)
                        }.padding(10)
                        VStack {
                            
                            
                            
                            
                            
                            Text("\( self.profileViewModel.followersCountState)").font(.headline)
                            Text("Followers").font(.subheadline)
                        }.padding(10)        .onTapGesture {
                            print(" followersCount Tapped")
                        }
                        VStack {
                            
                            //                            NavigationLink(destination: LazyView {FollowUserView(users: self.users!)}) {
                            Text("\(self.profileViewModel.followingCountState)").font(.headline)
                            Text("Following").font(.subheadline)
                            
                            
                        }.padding(10)
                        Spacer()
                    }
                    
                    
                    
                    
                    
                    
                    
                    //
                    //                                    ProfileHeader(user: profileViewModel.user ,users: followViewModel.users, movieCount: profileViewModel.posts.count,followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                    
                    ProfileInformation(user: user)
                    HStack(spacing: 5) {
                        FollowButton(user: user, isFollowing: $profileViewModel.isFollowing, followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                        
                        MessageButton()
                    }.padding(.leading, 20).padding(.trailing, 20)
                    
                    //                         Picker(selection: $selection, label: Text("Grid or Table")) {
                    //                                    ForEach(0..<displayState.count) { index in
                    //                                        Image(systemName: self.displayState[index]).tag(index)
                    //
                    //                                    }
                    //                         }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                    
                    if !profileViewModel.isLoading {
                        GridPosts(splitted: self.profileViewModel.splitted)
                        
                        
                    }
                    
                    
                    //                    VStack(alignment: .leading, spacing: 1) {
                    //                        // rows
                    //                        ForEach(0..<splitted.count) { index in
                    //                            HStack(spacing: 1) {
                    //                                // Columns
                    //                                ForEach(splitted[index]) { photo_element in
                    //                                    Image(photo_element.photo).resizable().scaledToFill().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3).clipped()
                    //
                    //                                }
                    //                            }
                    //
                    //                        }
                    //                    }
                    
                }.padding(.top, 20)
                
            }.navigationBarTitle(Text(self.user.username), displayMode: .inline).onAppear {
                self.profileViewModel.loadUserPosts(userId: self.user.uid)
                //                self.followViewModel.searchFollowerUsers(userId: self.profileViewModel.user.uid)
                
        }
        
        
        
        
    }
}


struct FollowButton: View {
    
    @ObservedObject var followViewModel = FollowViewModel()
    
    var user: User
    @Binding var following_Count: Int
    @Binding var followers_Count: Int
    @Binding var isFollowing: Bool
    //
    init(user: User, isFollowing: Binding<Bool>, followingCount: Binding<Int>, followersCount: Binding<Int>) {
        self.user = user
        self._following_Count = followingCount
        self._followers_Count = followersCount
        self._isFollowing = isFollowing
    }
    //    updateFollowCount()
    // checkFollowState()
    //
    //
    //
    //
    //        //        self.followersCount = followViewModel.followersCount
    //        //        self.followingCount =  followViewModel.followingCount
    //    }
    
    //    func checkFollowState() {
    //        followViewModel.checkFollow(userId: self.user.uid)
    //    }
    
    
    //    func updateFollowCount() {
    //        followViewModel.updateFollowCount(userId: user.uid, followingCount_onSuccess: { (following_Count) in
    //            self.following_Count = following_Count
    //        }) { (followers_Count) in
    //            self.followers_Count = followers_Count
    //        }
    //    }
    //
    
    func follow() {
        if !self.isFollowing {
            followViewModel.follow(userId: user.uid, user: user,  followingCount_onSuccess: { (followingCount) in
                self.following_Count = followingCount
            }) { (followersCount) in
                self.followers_Count = followersCount
            }
            self.isFollowing = true
            
        } else {
            followViewModel.unfollow(userId: user.uid,  followingCount_onSuccess: { (followingCount) in
                self.following_Count = followingCount
            }) { (followersCount) in
                self.followers_Count = followersCount
            }
            self.isFollowing = false
        }
        
    }
    
    var body: some View {
        Button(action: follow) {
            HStack {
                Spacer()
                Text((self.isFollowing) ? "UnFollow" : "Follow").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 30).background(Color("Color2"))
            
        }.cornerRadius(5)
    }
}
struct MessageButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Message").fontWeight(.bold).foregroundColor(Color.black)
                Spacer()
            }.frame(height: 30).background(Color.white)
            
        }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5), lineWidth: 1))
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
