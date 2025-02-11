//
//  MoviePopularCard.swift
//  FrontYard
//
//  Created by Dustin yang on 6/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviePopularCard: View {
        let movie: Movie
        
        var body: some View {
            VStack {
                AnimatedImage(url: self.movie.posterURL)
                    .resizable().frame(width :  (UIScreen.main.bounds.width ) / 1.8, height:  (UIScreen.main.bounds.height ) / 4.3).cornerRadius(20).aspectRatio(contentMode: .fit)
                
                                  Text(movie.title)
                                    .font(.callout)
                                      .padding(.top,5)
                HStack {
  
                    if !movie.ratingText.isEmpty {
                        Text(movie.ratingText).font(.caption).foregroundColor(.yellow)
                    }
                    Text(movie.scoreText).font(.caption)
                }
                
                
            } .padding(.horizontal, 5)
                // half screen - spacing - two side paddings = 60
                .frame(width: (UIScreen.main.bounds.width ) / 1.6, height: (UIScreen.main.bounds.height ) / 3.2)
                .background(Color("Color1"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)

        }
        
}

struct MoviePopularCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePopularCard(movie: Movie.stubbedMovie)
    }
}
