//
//  ContentView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//
import SwiftUI
import FirebaseAuth


struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var show = false
    @State private var isSettingsOpen = false
    @EnvironmentObject var session: SessionStore
    func listen() {
        print("Listen")
        session.listenAuthenticationState()
    }
    //    func logout() {
    //        session.logout()
    //    }
    var body: some View{
        
        ZStack{
            
            // Menu...
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Image("128").resizable().frame(width: 100, height: 100).cornerRadius(50)
                    
                    
                    
                    Image("FrontYard").resizable().frame(width: 140, height: 25)
                    
                    
                    
                    Button(action: {
                        self.index = 0
                        
                        // animating Views...
                        
                        // Each Time Tab Is Clicked Menu Will be Closed...
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image(systemName: "film").resizable().frame(width: 18, height: 18)
                                .foregroundColor(self.index == 0 ? Color("Color2") : Color.white)
                            Text("Now Playing")
                                .foregroundColor(self.index == 0 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 0 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top,25)
                    
                    Button(action: {
                        
                        self.index = 1
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image("popcorn").resizable().frame(width: 18, height: 18)
                                .foregroundColor(self.index == 1 ? Color("Color2") : Color.white)
                            
                            
                            Text("Top Rated")
                                .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 1 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                        self.index = 2
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image(systemName: "calendar").resizable().frame(width: 18, height: 18)
                                .foregroundColor(self.index == 2 ? Color("Color2") : Color.white)
                            
                            
                            Text("Upcoming")
                                .foregroundColor(self.index == 2 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 2 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                        self.index = 3
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image("Search").resizable().frame(width: 18, height: 18)
                                .foregroundColor(self.index == 3 ? Color("Color2") : Color.white)
                            
                            
                            Text("Search")
                                .foregroundColor(self.index == 3 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 3 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    
                    Button(action: {
                        
                        self.index = 4
                        //                        self.session.logout()
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image("heart").resizable().frame(width: 18, height: 18)
                                .foregroundColor(self.index == 4 ? Color("Color2") : Color.white)
                            
                            
                            Text("My List")
                                .foregroundColor(self.index == 4 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 4 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    
                    
                    Button(action: {
                        self.index = 5
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                    }) {
                        
                        HStack(spacing: 20){
                            
                            Image("settings").resizable().frame(width: 18, height: 18)
                                .foregroundColor(Color.white)
                            
                            
                            Text("Setting")
                                .foregroundColor(self.index == 5 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 5 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    //
                    //                    Button(action: {
                    //
                    //
                    //                    }) {
                    //
                    //                        VStack(spacing: 25){
                    //
                    //                            //                            Image("out")
                    //                            //                                .foregroundColor(Color.white)
                    //
                    //
                    //                            Text("App version: 1.0.0")
                    //                                .foregroundColor(Color.white)
                    //
                    //
                    //                            Text("Developer: Dustin yang")
                    //                                .foregroundColor(Color.white)
                    //
                    //                        }
                    //                            //                        .padding(.vertical, 10)
                    //                            .padding(.horizontal,8)
                    //                    }
                    //
                    Spacer(minLength: 0)
                }
                .padding(.top,25)
                .padding(.horizontal,20)
                
                Spacer(minLength: 0)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            // MainView...
            
            VStack(spacing: 0){
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        // close Button...
                        
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    // Changing Name Based On Index...
                    
                    Text(self.index == 0 ? "Now Playing" : (self.index == 1 ? "Trending" : (self.index == 2 ? "Upcoming" :
                        (self.index == 3 ? "Search Movies" :  (self.index == 4 ? "My List" : "Setting")))))
                        .font(.title)
                        .foregroundColor(Color("Color2")).fontWeight(.bold)
                    
                    Spacer(minLength: 0)
                    
//                    
//                       Button(action: {}) {
//                           NavigationLink(destination: UsersView()) {
//                               Image(systemName: "person.fill").imageScale(Image.Scale.large).foregroundColor(.black)
//                           }
//                       }
//                        
//                        
//                        
//                       Button(action: {
//                           self.session.logout()
//                           
//                       }) {
//                           
//                           Image(systemName: "arrow.right.circle.fill").imageScale(Image.Scale.large).foregroundColor(.black)
//                           
//                       }
                    
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding().frame( height: 100)
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        // Changing Views Based On Index...
                        
                        if self.index == 0{
                            
                            //                            MainPage()
                            MovieListView()
                        }
                        else if self.index == 1{
                            MovieTopRatedView()
                        }
                        else if self.index == 2{
                            
                            MovieUpComingView()
                        }
                        else if self.index == 3{
                            
                            MovieSearchView()
                        }
                        else if self.index == 4{
                            
                            
                            if(Auth.auth().currentUser != nil){
                                 ProfileView()
                            }else{
                                Color.black
                                
                            }
                            
                        }
                        else{
                            SettingsView(isSettingsOpen: self.$isSettingsOpen)
                        }
                    }
                }.background(Color("Color1"))
            }
            .background(Color("Color1"))
                //Applying Corner Radius...
                .cornerRadius(self.show ? 30 : 0)
                // Shrinking And Moving View Right Side When Menu Button Is Clicked...
                .scaleEffect(self.show ? 0.9 : 1)
                .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
                // Rotating Slighlty...
                .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: listen)
    }
}
