//
//  MoviePosterCard.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviePosterCard: View {
    
    let movie: Movie
    var body: some View {

        VStack {
            AnimatedImage(url: self.movie.posterURL)
                .resizable().frame(width: (UIScreen.main.bounds.width - 75) / 2, height: (UIScreen.main.bounds.height ) / 4.2).cornerRadius(20)
            HStack {
             
                         Text(movie.title).font(.footnote)
                     }
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).font(.footnote).foregroundColor(.yellow)
                }
                 Text(movie.scoreText).fontWeight(.medium).foregroundColor(Color("Color2"))
         
            }
         
            
            
        } .padding(.all, 5)
            .frame(width: (UIScreen.main.bounds.width - 60) / 2)
            .background(Color("Color1"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: Movie.stubbedMovie)
    }
}

