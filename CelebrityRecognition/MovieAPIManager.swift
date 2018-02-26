//
//  MovieAPIManager.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 23/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import Foundation

class MovieApiManager{
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let searchUrl = "https://api.themoviedb.org/3/search/person"
    static let apiKey = "4aebe566ef8c2257a0ca6a337f1994ef"
    static let imageUrlPrefix = "https://image.tmdb.org/t/p/w500/"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getCelebrity(searchQuery: String, completion: @escaping (Celebrity?, Error?) -> ()){
        let urlString = MovieApiManager.searchUrl + "?api_key=\(MovieApiManager.apiKey)&language=en-US&query=\(searchQuery)&page=1"
        let safeString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: safeString!)
        
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let personDictionary = dataDictionary["results"] as! [[String: Any]]
                
                let name = personDictionary[0]["name"] as! String
                let id = personDictionary[0]["id"] as! Int
                let knownFor = personDictionary[0]["known_for"] as! NSArray
                //for movie in knownFor{
                  //  print("\n\nmovie: \n \(movie)\n\n")
                //}
                

                let celeb = Celebrity(name: name, id: id, knownFor: knownFor)
                completion(celeb, nil)
            
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getImage(id: Int, completion: @escaping (URL?, Error?) -> ()){
        let urlString = "https://api.themoviedb.org/3/person" + "/\(id)/images?api_key=\(MovieApiManager.apiKey)"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let images = dataDictionary["profiles"] as! [[String: Any]]
                
                print("\n\n\n")
                print(images)
                let imageUrlSuffix = images[0]["file_path"] as! String
                
                let imageUrl = MovieApiManager.imageUrlPrefix + imageUrlSuffix
                
                let returnURL = URL(string: imageUrl)
                
                completion(returnURL, nil)
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
}
