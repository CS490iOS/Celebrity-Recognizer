//
//  VideoViewController.swift
//  CelebrityRecognition
//
//  Created by Rahul Balla on 3/28/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            let movieID = movie.idNumber
            movieTrailers(id: movieID)
            
        }

        // Do any additional setup after loading the view.
    }
    
    func movieTrailers(id: Int){
        let url = URL(string: MovieApiManager.baseUrl + "\(id)/videos?api_key=\(MovieApiManager.apiKey)&language=en-US")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionary = dataDictionary["results"] as! [[String:Any]]
                let movie = movieDictionary[0]
                let movieKey = movie["key"] as! String
                
                print(movieKey);
                
                self.loadYoutubeVideo(videoID: movieKey)
            }
        }
        task.resume();
    }
    
    func loadYoutubeVideo(videoID: String){
        let urlString = "https://www.youtube.com/embed/\(videoID)"
        let youtubeURL = URL(string: urlString)
        print(urlString)
        webView.loadRequest(URLRequest(url: youtubeURL!))
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
