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


// card View...

struct CardView2 : View {
    
    @Binding var data : Card
    @Binding var hero : Bool
    
    var body: some View{
        
        
        // going to implement close button...
        
        ZStack(alignment: .topTrailing){
          
            VStack{
            
                Image(self.data.image)
                .resizable()
                .frame(height: self.data.expand ? 350 : 250)
                    .cornerRadius(self.data.expand ? 0 : 25).padding(.top , self.data.expand ? 100 :0)
                
                if self.data.expand{
                    
                    HStack{
                        
                        Text(self.data.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text(self.data.details)
                        .padding(.horizontal)
                    
                    HStack{
                        
                        Text("Details")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    HStack(spacing: 0){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("mcard1")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("mcard2")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("mcard3")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("mcard4")
                        }
                    }
                    .padding(.horizontal, 25)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Let's Go")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20)
            // to ignore spacer scroll....
                .contentShape(Rectangle())
            


        }
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
