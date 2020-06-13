//
//  MovieTopRatedView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/9/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct MovieTopRatedView: View {
    //    @ObservedObject private var nowPlayingState = MovieListState()
//    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    init() {
        //        self.upcomingState.loadMovies(with: .upcoming)
        self.topRatedState.loadMovies(with: .topRated)
        self.popularState.loadMovies(with: .popular)
    }
    var body: some View {
        NavigationView {
            VStack   {
                GeometryReader{_ in
                    VStack(spacing: 5){

                        HStack{

                            Text("Top Rated").fontWeight(.heavy).font(.headline).foregroundColor(Color("Color2"))
                            Spacer()

                        }.padding(.leading, 12)
                        
                        if self.topRatedState.movies != nil {
                            MovieBackdropCarouselView(title: "Top Rated", movies: self.topRatedState.movies!)
                            
                        } else {
                            LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                                self.topRatedState.loadMovies(with: .topRated)
                            }
                        }
//                        Spacer()
                    }
                    
                    
                    
                    
                    
                }
                //                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))

                GeometryReader{_ in
                    VStack(spacing: 5){
                 
                        
                        if self.popularState.movies != nil {
                            MoviePopularCarouselView(title: "Popular", movies: self.popularState.movies!)
                            
                        } else {
                            LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                                self.topRatedState.loadMovies(with: .popular)
                            }
                        }
                        Spacer()
                    }
                    
                    
                    
                    
                    
                }

                
                
                
            }
            .navigationBarHidden(true)
            .navigationBarTitle("").font(.caption).padding(.horizontal, 12)
        }
        
        
    }

    
}

struct MovieTopRatedView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTopRatedView()
    }
}
