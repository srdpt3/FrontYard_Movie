//
//  MyMovieListModel.swift
//  FrontYard
//
//  Created by Dustin yang on 6/18/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

class MyMovieListModel: ObservableObject {
    
    @Published var isSucess = false
    
    
    func addToMyList(userId: String, movieId: Int, imageURL:String) {
        
        
        let myMovie = MyList(movieId: movieId, imageURL: imageURL)
        
        guard let dict = try? myMovie.toDictionary() else {return}

        Ref.FIRESTORE_COLLECTION_MYLIST_USERID(userId: userId, movieId: movieId).setData(dict) { (error) in
            if error == nil {
                print("persist sucessfully to my favorite list")
                self.isSucess = true
            }
        }
        
        
    }
    
}

