//
//  MoviePopularCarouselView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct MoviePopularCarouselView: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                
                Text("Popular").fontWeight(.heavy).font(.title)
                    .foregroundColor(Color("Color2"))
                Spacer()

                
            }.padding(.leading, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    HStack(spacing : 10){
                        ForEach(self.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                MoviePopularCard(movie: movie)
                                
                                
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.leading, movie.id == self.movies.first!.id ? 12 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 12 : 0)
                        }
                    }
                    
                    
                    
                    
                }
            }
        }
    }
}

struct MoviePopularCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePopularCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
