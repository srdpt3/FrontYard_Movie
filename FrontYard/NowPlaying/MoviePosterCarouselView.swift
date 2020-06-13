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
        VStack(spacing: 0){
            Text(
            "hi")
//
//            if !self.grid.isEmpty{
//
//                ScrollView(.vertical, showsIndicators: false) {
//
//
//                    VStack(spacing: 20){
//                        ForEach(self.grid,id: \.self){i in
//
//                            HStack(spacing: 16){
//                                ForEach(i...i+1,id:  \.self){j in
//                                    VStack{
//                                        if j != self.movies.count{
//
//                                            NavigationLink(destination: MovieDetailView(movieId: self.movies[j].id)) {
//
//                                                MoviePosterCard(movie: self.movies[j])
//
//
//
//                                            }
//
//
//
//                                        }
//                                    }
//                                }
//
//                                if i == self.grid.last! && self.movies.count % 2 != 0{
//
//                                    Spacer(minLength:  0)
//                                }
//                            }.padding(.horizontal, 12)
//                        }
//                    }
//                }
//
//            }
//
        }
        
    }
    
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
