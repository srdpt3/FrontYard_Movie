//
//  ProfileView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/16/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct Photo: Identifiable {
    let id = UUID()
    var photo = ""
}

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileViewModel = ProfileViewModel()
    
    
    init() {
        self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
    }
    
    var photoArray = [Photo(photo: "photo"), Photo(photo: "photo1"), Photo(photo: "photo2"), Photo(photo: "photo3"), Photo(photo: "photo4"), Photo(photo: "photo5"), Photo(photo: "photo6"), Photo(photo: "photo7"),  Photo(photo: "photo8"), Photo(photo: "photo9")]
    
    
    @State var selection = 0
    var displayState = ["square.grid.2x2.fill", "list.dash"]
    var body: some View {
        let splitted = photoArray.splited(into: 3)
        return
            NavigationView {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        ProfileHeader(user: self.session.userSession,followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                        
                        //                        EditProfileButton()
                        ProfileInformation(user: self.session.userSession!)
                        //
                        //                        Picker(selection: $selection, label: Text("Grid or Table")) {
                        //                            ForEach(0..<displayState.count) { index in
                        //                                Image(systemName: self.displayState[index]).tag(index)
                        //
                        //                            }
                        //                        }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                        VStack(alignment: .leading, spacing: 1) {
                            // rows
                            ForEach(0..<splitted.count) { index in
                                HStack(spacing: 1) {
                                    // Columns
                                    ForEach(splitted[index]) { photo_element in
                                        Image(photo_element.photo).resizable().scaledToFill().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3).clipped()
                                        
                                    }
                                }
                                
                            }
                        }
                        
                    }.padding(.top, 20)
                    
                }.navigationBarTitle( Text(self.session.userSession!.username).bold(), displayMode: .inline).navigationBarItems(leading:
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


//func downloadUserFromFirestore(userId: String, email: String) {
//
//    Ref.FIRESTORE_DOCUMENT_USERID(userId: user.uid)
//                  firestoreUserId.getDocument { (document, error) in
//                      if let dict = document?.data() {
//                        print(dict)
//                          guard let decoderUser = try? User.init(_dictionary: dict as NSDictionary) else {return}
//                        self.userSession = decoderUser
//                      }
//                  }
//    
//    
//    
//    Ref.FIRESTORE_DOCUMENT_USERID(userId: userId).getDocument { (snapshot, error) in
//
//        guard let snapshot = snapshot else { return }
//
//        if snapshot.exists {
//            print("download current user from firestore")
//            saveUserLocally(mUserDictionary: snapshot.data()! as NSDictionary)
//        } else {
//            //there is no user, save new in firestore
//
//            let user = User(_objectId: userId, _email: email, _firstName: "", _lastName: "")
//            saveUserLocally(mUserDictionary: userDictionaryFrom(user: user))
//            saveUserToFirestore(mUser: user)
//        }
//    }
//
//
//}


func saveUserLocally(mUserDictionary: NSDictionary) {
    
    UserDefaults.standard.set(mUserDictionary, forKey: "currentUser")
    UserDefaults.standard.synchronize()
}
