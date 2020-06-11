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
                    //
                    //                        HStack{
                    //
                    //                            Text("Up Coming").fontWeight(.heavy).font(.title).foregroundColor(Color("Color2"))
                    //                            Spacer()
                    //
                    //                        }.padding(.leading, 16)
                    
                    if self.upcomingState.movies != nil {
                        MainSubViewUpComing(title: "Up Coming", movies: self.upcomingState.movies!, grid: self.upcomingState.Grid)
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
    
    let grid : [Int]
    var body : some View{
        
        VStack(spacing: 0){
            
            VStack{
                if !self.grid.isEmpty{
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        
                        VStack(spacing: 20){
                            ForEach(self.grid,id: \.self){i in
                                
                                HStack(spacing: 16){
                                    ForEach(i...i+1,id:  \.self){j in
                                        VStack{
                                            if j != self.movies.count{
                                                
                                                NavigationLink(destination: MovieDetailView(movieId: self.movies[j].id)) {
                                                    
                                                    MovieUpComingCard(movie: self.movies[j])
                                                    
                                                    
                                                    
                                                }
                                                
                                                
                                                
                                            }
                                        }
                                    }
                                    
                                    if i == self.grid.last! && self.movies.count % 2 != 0{
                                        
                                        Spacer(minLength:  0)
                                    }
                                }.padding(.horizontal, 12)
                            }
                        }
                    }
                }
                
                
                
                
                
            }.padding()
        }
    }
}

struct MovieUpComingCard: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AnimatedImage(url: self.movie.posterURL)
                .resizable().frame(width: (UIScreen.main.bounds.width - 75) / 2, height: (UIScreen.main.bounds.height ) / 4.2).cornerRadius(20)
            
            HStack {
                //                if !movie.ratingText.isEmpty {
                //                    Text(movie.ratingText).font(.footnote).foregroundColor(.yellow)
                //                }
                Text(movie.title).font(.footnote)
            }
            
            
        } .padding(.all, 5)
            .frame(width: (UIScreen.main.bounds.width - 60) / 2)
            .background(Color("Color1"))
            .cornerRadius(20)
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
