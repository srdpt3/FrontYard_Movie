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
    
    init() {
        self.nowPlayingState.loadMovies(with: .nowPlaying)
        
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
            
            
            
            
        }.background(Color("Color1"))
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


