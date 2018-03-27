//
//  Celebrity.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 23/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import Foundation

class Celebrity{
    var name: String
    var id: Int
    var imageUrl: URL?
    var knownFor: [[String: Any]]?
    
    init(name: String, id: Int, knownFor: [[String: Any]]){
        self.name = name
        self.id = id
        self.knownFor = knownFor
    }
}
