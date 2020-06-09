//
//  MovieListView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    //    @ObservedObject private var upcomingState = MovieListState()
    //    @ObservedObject private var topRatedState = MovieListState()
    //    @ObservedObject private var popularState = MovieListState()
    init() {
        self.nowPlayingState.loadMovies(with: .nowPlaying)
        //               self.upcomingState.loadMovies(with: .upcoming)
        //               self.topRatedState.loadMovies(with: .topRated)
        //               self.popularState.loadMovies(with: .popular)
    }
    var body: some View {
        NavigationView {
            
            
            VStack{
                if nowPlayingState.movies != nil {
                    MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                    
                    
                    
                    
                    
                } else {
                    LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                    }
                }
            }.navigationBarHidden(true)
                .navigationBarTitle("").font(.caption).padding(.top ,10)
            
            
            
            //                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            //                Group {
            //                    if upcomingState.movies != nil {
            //                        MovieBackdropCarouselView(title: "상영예작", movies: upcomingState.movies!)
            //                    } else {
            //                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
            //                            self.upcomingState.loadMovies(with: .upcoming)
            //                        }
            //                    }
            //                }
            //                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            //
            //
            //                Group {
            //                    if topRatedState.movies != nil {
            //                        MovieBackdropCarouselView(title: "평점 좋은영화들", movies: topRatedState.movies!)
            ////                        ContentView2()
            //
            //                    } else {
            //                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
            //                            self.topRatedState.loadMovies(with: .topRated)
            //                        }
            //                    }
            //
            //
            //                }
            //                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            //
            //                Group {
            //                    if popularState.movies != nil {
            //                        MovieBackdropCarouselView(title: "인기 영화", movies: popularState.movies!)
            //
            //                    } else {
            //                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
            //                            self.popularState.loadMovies(with: .popular)
            //                        }
            //                    }
            //                }
            //                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            //
            //
            
            //            }.navigationBarHidden(true)
            //            .navigationBarTitle("").font(.caption)
            //            .navigationBarItems(leading:
            //                HStack{
            //                    Image("pic").renderingMode(.original).resizable().frame(width: 30, height: 30).cornerRadius(15)
            //
            //                }
            //            )
            
        }.background(Color("Color1"))
            .onAppear {
                //            self.nowPlayingState.loadMovies(with: .nowPlaying)
                //            self.upcomingState.loadMovies(with: .upcoming)
                //            self.topRatedState.loadMovies(with: .topRated)
                //            self.popularState.loadMovies(with: .popular)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


