//
//  ContentView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//
import SwiftUI


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
                        
                        HStack(spacing: 25){
                            
                            Image(systemName: "film")
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
                        
                        HStack(spacing: 25){
                            
                            Image("heart")
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
                        
                        HStack(spacing: 25){
                            
                            Image(systemName: "calendar")
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
                        
                        HStack(spacing: 25){
                            
                            Image("Search")
                                .foregroundColor(self.index == 3 ? Color("Color2") : Color.white)
                            
                            
                            Text("Search")
                                .foregroundColor(self.index == 3 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 3 ? Color("Color2").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    
                    
                    Button(action: {
                        self.index = 4
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                    }) {
                        
                        HStack(spacing: 25){
                            
                            Image("settings")
                                .foregroundColor(Color.white)
                            
                            
                            Text("Info")
                                .foregroundColor(self.index == 4 ? Color("Color2") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,8)
                        .background(self.index == 4 ? Color("Color2").opacity(0.2) : Color.clear)
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
                    
                    Text(self.index == 0 ? "Now Playing" : (self.index == 1 ? "Trending" : (self.index == 2 ? "Upcoming Movies" : "Search Movie")))
                        .font(.title)
                        .foregroundColor(Color("Color2")).fontWeight(.bold)
                    
                    Spacer(minLength: 0)
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
                        else{
                             Color("Color2")
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
    }
}

// Mainpage View...

struct MainPage : View {
    
    var body: some View{
        
        VStack{
            
            ZStack(alignment: .bottomTrailing) {
                
                VStack(spacing: 12){
                    
                    Image("top")
                        .resizable()
                        .frame(height: 210)
                    
                    Text("Bell Local Helmet")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    Text("Orange Cycle Helmet")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.black.opacity(0.06))
                .cornerRadius(15)
                .padding()
                
                // Cart Button...
                
                Button(action: {
                    
                    
                }) {
                    
                    Image("cart")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Color1"))
                        .cornerRadius(15)
                }
                .padding(.trailing)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    HStack(spacing: 15){
                        
                        Image("h1")
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Xioami Ninebot")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Black scooter helmet")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack(spacing: 15){
                        
                        Image("h2")
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Apple Ninebot")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Urban cycle helmet")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer(minLength: 0)
                    }
                }
                .padding()
            }
        }
    }
}

