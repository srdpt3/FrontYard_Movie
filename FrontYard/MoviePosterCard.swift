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
    //    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack(alignment: .center) { 
            
            VStack{
                AnimatedImage(url: self.movie.posterURL)
                    .resizable().frame(width : 280, height: 260).aspectRatio(contentMode: .fit)
                
                Text(movie.title)
                    .font(.title)
                    .padding(.top,5)
                HStack {
                    if !movie.ratingText.isEmpty {
                        Text(movie.ratingText).foregroundColor(.yellow)
                    }
                    Text(movie.scoreText)
                }

                Text(movie.releaseDate!)
                    .font(.subheadline)
                    .padding(.top,5)
                
                
            }  .padding()
                // half screen - spacing - two side paddings = 60
                .frame(width: (UIScreen.main.bounds.width - 50))
                .background(Color("Color1"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            
            //            } else {
            //                Rectangle()
            //                    .fill(Color.gray.opacity(0.3))
            //                    .cornerRadius(8)
            //                    .shadow(radius: 4)
            //
            //                Text(movie.title)
            //                    .multilineTextAlignment(.center)
            //            }
        }
            //        .frame(width: 204, height: 306)
            .onAppear {
                //                self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

//struct MoviePosterCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePosterCard(movie: Movie.stubbedMovie)
//    }
//}

