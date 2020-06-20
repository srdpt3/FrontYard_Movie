//
//  MyMovieListModel.swift
//  FrontYard
//
//  Created by Dustin yang on 6/18/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import FirebaseAuth

class MyMovieListModel: ObservableObject {
    
    @Published var isSucess = false
    @Published var liked : Bool = false

    
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
    
    
    func checkLiked(id: Int) {
        
        Ref.FIRESTORE_COLLECTION_MYLIST_USERID(userId: Auth.auth().currentUser!.uid, movieId: id).getDocument { (document, error) in
            print(document?.data())

            if let doc = document, doc.exists {
                self.liked = true
            } else {
                self.liked  = false
            }
            
        }
        
        
    }
    
    
    func removeFromList(id : Int){
        Ref.FIRESTORE_COLLECTION_MYLIST_USERID(userId: Auth.auth().currentUser!.uid, movieId: id).getDocument { (document, error) in
              
            print(document?.data())
              if let doc = document, doc.exists {
                doc.reference.delete()
            }
              
          }
    }
    
}

