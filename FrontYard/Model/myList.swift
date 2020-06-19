//
//  myList.swift
//  FrontYard
//
//  Created by Dustin yang on 6/18/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
struct MyList: Encodable, Decodable {
    var movieId: Int
    var imageURL: String
    

    init(movieId: Int, imageURL: String) {
        self.movieId = movieId
        self.imageURL = imageURL
        
        
        
    }
    init(_dictionary: NSDictionary) {
        movieId = _dictionary["movieId"] as! Int
        imageURL = _dictionary["imageURL"] as! String
    }
    

}
