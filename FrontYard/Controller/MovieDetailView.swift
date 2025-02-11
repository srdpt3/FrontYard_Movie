//
//  MovieDetailView.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct MovieDetailView: View {
    
    let movieId: Int
    
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                MovieDetailListView(movie: self.movieDetailState.movie!)
                
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}

struct MovieDetailListView: View {
    @ObservedObject private var myMovieListModel = MyMovieListModel()
    
    var movie: Movie
    @State private var selectedTrailer: MovieVideo?
    let imageLoader = ImageLoader()
    var color : Int = 0
    @State var liked : Bool = false
    let HEARTFILL = "suit.heart"
    let HEART = "suit.heart"
    
    
    
    func addToMyList(){
        
        
        if(User.currentUser() != nil){
            if(self.myMovieListModel.liked){
                //remove from the list
                self.myMovieListModel.removeFromList(id: self.movie.id)
            }else{
                
                // Add to the list
                self.myMovieListModel.addToMyList(userId: Auth.auth().currentUser!.uid, movieId: self.movie.id  , imageURL: self.movie.posterURL.absoluteString )
            }
            self.myMovieListModel.liked.toggle()

        }
        
        
        
        
        
        
    }
    
    var body: some View {
        
        List {
            MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                Text(movie.genreText)
                Text("·")
                Text(movie.yearText)
                Text(movie.durationText)
            }
            
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
                
                Spacer()
                Button(action: addToMyList) {
                    
                    Image(self.myMovieListModel.liked == true ? "heartred" : "heartwhite").resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fit)
                    //                        .renderingMode(.original)
                    //                        .padding()
                    
                    
                }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                    .background(Color.white)
                //                    .clipShape(Circle())
            }
            
            
            Divider()
            
            HStack(alignment: .top, spacing: 4) {
                if movie.cast != nil && movie.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Cast").font(.headline)
                        ForEach(self.movie.cast!.prefix(10)) { cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                }
                
                if movie.crew != nil && movie.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if movie.directors != nil && movie.directors!.count > 0 {
                            Text("Director").font(.headline)
                            ForEach(self.movie.directors!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if movie.producers != nil && movie.producers!.count > 0 {
                            Text("Producer").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if movie.screenWriters != nil && movie.screenWriters!.count > 0 {
                            Text("Story Writer").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Divider()
            
            if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
                HStack{
                    Text("Trailer").font(.headline)
                    Image(systemName: "play.circle.fill").resizable().frame(width: 20, height: 20)
                        .foregroundColor(Color("Color2"))
                }
                
                ForEach(movie.youtubeTrailers!) { trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }) {
                        HStack {
                            Text(trailer.name)
                            Spacer()
                            
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color("Color2"))
                        }
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }.padding(.bottom, 80).onAppear(){
            
            if(User.currentUser() != nil){
                self.myMovieListModel.checkLiked(id: self.movie.id)
                
            }
            
            
        }
    }
    
    
}

struct MovieDetailImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MovieDetailView(movieId: Movie.stubbedMovie.id)
//        }
//    }
//}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
