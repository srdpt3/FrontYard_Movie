//
//  MovieUpComingView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieUpComingView: View {
    @ObservedObject private var upcomingState = MovieListState()
    
    init() {
        self.upcomingState.loadMovies(with: .upcoming)
        
    }
    var body: some View {
        NavigationView {
            VStack   {
                //                GeometryReader{_ in
                VStack(spacing: 10){

                    if self.upcomingState.movies != nil {
                        MainSubViewUpComing(title: "Up Coming", movies: self.upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .topRated)
                        }
                    }
                    //                        Spacer()
                }
                
                
                
                
                
                //                }
                
                
                
                
            }
            .navigationBarHidden(true)
            .navigationBarTitle("").font(.caption).padding(.horizontal, 16)            .padding(.bottom, 45)
            
        }
        
        
    }
    
    
}


struct MainSubViewUpComing : View{
    let title: String
    let movies: [Movie]
    
    var body : some View{
        
        VStack(spacing: 0){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    ForEach(0..<movies.chunked(3).count){index in
                        
                        HStack(spacing: 8){
                            ForEach(self.movies.chunked(3)[index]){city in
                                
                                NavigationLink(destination: MovieDetailView(movieId: city.id)) {
                                    
                                    MovieUpComingCard(movie: city)
                                    
                                    
                                    
                                }
                                
                                
                            }
                        }.padding(.horizontal, 12)
                        
                    }
                }
                
            }
            
        }.padding()
        
        
    }
}

struct MovieUpComingCard: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AnimatedImage(url: self.movie.posterURL)
                .resizable().frame(width: (UIScreen.main.bounds.width - 35) / 3, height: (UIScreen.main.bounds.height ) / 5).cornerRadius(15)
            HStack {
                
                Text(movie.title).font(.footnote).lineLimit(1)
            }
            
            
            
            
        } .padding(.all, 8)
            .frame(width: (UIScreen.main.bounds.width - 25) / 3)
            .background(Color("Color1"))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
        
        
        
    }
    
}

//struct MovieUpComingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieUpComingView()
//    }
//}
//

extension Array{
    func chunked(_ size: Int)->[[Element]]{
        stride(from: 0, to: count, by: size).map{
            Array(self[$0 ..< Swift.min($0+size, count)])
        }
    }
}
