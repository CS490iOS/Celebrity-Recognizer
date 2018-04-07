//
//  VideoViewController.swift
//  CelebrityRecognition
//
//  Created by Rahul Balla on 3/28/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import AlamofireImage

class VideoViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var smallPosterImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        posterImageView.af_setImage(withURL: (movie?.backDropUrl!)!)
        smallPosterImageView.af_setImage(withURL: (movie?.posterUrl!)!)
        titleLabel.text = movie?.title.uppercased()
        overviewLabel.text = movie?.overview
        dateLabel.text = movie?.releaseDate
        
        smallPosterImageView.layer.borderWidth = 1
        let color = UIColor(red: 255.0/255.0, green: 41.0/255.0, blue: 83.0/255.0, alpha: 1)
        smallPosterImageView.layer.borderColor = color.cgColor
        smallPosterImageView.layer.masksToBounds = true
        
        if let movie = movie {
            let movieID = movie.idNumber
            movieTrailers(id: movieID)
        }
        
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
