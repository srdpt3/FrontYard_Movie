//
//  MovieListState.swift
//  FrontYard
//
//  Created by Dustin yang on 6/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//
import SwiftUI

class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    var result: [Movie]?
    var index = 1
    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        
         if(endpoint == .nowPlaying ){
            self.index = 2
         }else if(endpoint == .upcoming ){
            self.index = 2
         }else{
            self.index = 1
        }
        
        
        self.movieService.fetchMovies(from: endpoint,page: self.index) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
                
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
        

        
        
        
        
    }
    
}
