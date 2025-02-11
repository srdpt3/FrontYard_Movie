//
//  MovieBackdropCard.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            AnimatedImage(url: self.movie.posterURL)
                .resizable().frame(width :  (UIScreen.main.bounds.width ) / 2.07, height:  (UIScreen.main.bounds.height ) / 4.0).cornerRadius(20).aspectRatio(contentMode: .fit)
            
                              Text(movie.title)
                                .font(.caption)
                                  .padding(.top,5)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).font(.caption).foregroundColor(.yellow)
                }
                Text(movie.scoreText).font(.caption)
            }
            
            
            
        } .padding(.all,10)
            // half screen - spacing - two side paddings = 60
            .frame(width: (UIScreen.main.bounds.width ) / 1.87)
            .background(Color("Color1"))
             .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            
            
            .onAppear {
                //                self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
    
    
    
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
