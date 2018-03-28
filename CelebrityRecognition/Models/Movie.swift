//
//  Movie.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 26/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var posterUrl: URL?
    var overview: String
    var backDropUrl: URL?
    var releaseDate: String
    var idNumber: Int
    
    init(dictionary: [String: Any]){
        title = dictionary["title"] as? String ?? "No Title"
        overview = dictionary["overview"] as? String ?? "No Overview"
        idNumber = dictionary["id"] as! Int
        
        let posterPathString = dictionary["poster_path"] as? String ?? "No Poster Path URL"
        let baseURLString = "https://image.tmdb.org/t/p/w780"
        let backDropPathString = dictionary["backdrop_path"] as? String ?? "No Backdrop Path"
        
        
        posterUrl = URL(string: baseURLString + posterPathString)!
        backDropUrl = URL(string: baseURLString + backDropPathString)!
        
        releaseDate = dictionary["release_date"] as? String ?? "No Release Date"
    }
    
}
