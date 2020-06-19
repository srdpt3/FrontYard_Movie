//
//  GridPost.swift
//  FrontYard
//
//  Created by Dustin yang on 6/18/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct GridPosts: View {
    
    var splitted: [[MyList]] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            // rows
            ForEach(0..<self.splitted.count) { index in
                HStack(spacing: 1) {
                    // Columns
                    ForEach(self.splitted[index], id: \.movieId) { movie in
                        
                        
                        NavigationLink(destination: MovieDetailView(movieId: movie.movieId)) {
                                AnimatedImage(url: URL(string: movie.imageURL)).resizable().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3).clipped().aspectRatio(contentMode: .fit)
                        }
                        
                    
  
                        
                        
                        
                        
                    }
                }
                
            }
        }
    }
}
