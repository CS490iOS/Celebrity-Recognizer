//
//  Post.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 27/03/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Post{
    var key: String?
    let imageURL : String
    let imageHeight: CGFloat
    let creationDate : Date
    let name: String
    
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "created_at" : createdAgo,
                "name" : name]
    }
    
    init(name: String, imageURL: String, imageHeight: CGFloat){
        self.name = name
        self.imageURL = imageURL
        self.creationDate = Date()
        self.imageHeight = imageHeight
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let name = dict["name"] as? String,
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval
            else { return nil }
        
        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
        self.name = name
    }
    
    
}
