//
//  MoviePosterCarouselView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//
import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
      var body: some View {
            VStack{
//                Text(title)
//                    .font(.title)
//                    .fontWeight(.bold).background(Color("Color1"))
//                    .padding(.horizontal)
    
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 14) {
                        ForEach(self.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                MoviePosterCard(movie: movie).padding(.horizontal)

                                }
//                            padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
//                            padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
    
        }

}

//struct MoviePosterCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies)
//    }
//}



//    var body: some View {
//        VStack{
////            Text(title)
////                .font(.title)
////                .fontWeight(.bold)
////                .padding(.horizontal)
//
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack(alignment: .top, spacing: 16) {
//                    ForEach(self.movies) { movie in
//                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
//                            MoviePosterCard(movie: movie)
//                        }.buttonStyle(PlainButtonStyle())
//                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
//                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
//                    }
//                }
//            }
//        }
//
//    }




struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
