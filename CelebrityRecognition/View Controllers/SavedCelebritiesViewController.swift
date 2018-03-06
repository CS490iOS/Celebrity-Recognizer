//
//  SavedCelebritiesViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 17/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import ALCameraViewController
import AWSRekognition

class SavedCelebritiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let recognition = AWSRekognition.default()
    var faces = [AWSRekognitionCelebrity?]()
    var currentCelebrity = AWSRekognitionCelebrity()
    var takenPicture = UIImage()
    var recognizedCelebrity : Celebrity?
    var imageUrl: URL?

    var celebrityName: String?
    
    // Variables for AWS Rekognition
    var sourceImage: UIImage?
    
    @IBAction func onCamera(_ sender: Any) {
        let cameraVC = CameraViewController { (image, asset) in
            if let sourceImage = image{
            self.sourceImage = sourceImage
            let group = DispatchGroup()
            let imageJPG = AWSRekognitionImage()
            imageJPG?.bytes = UIImageJPEGRepresentation(self.sourceImage!, 0.6)
            
            guard let request = AWSRekognitionRecognizeCelebritiesRequest() else {
                puts("Unable to initialize AWSRekognitionDetectLabelsRequest.")
                return
            }
            request.image = imageJPG
            group.enter()
            self.recognition.recognizeCelebrities(request) { (response, error) in
                if error == nil{
                    let faces = response?.celebrityFaces
                    self.faces = faces!
                    self.currentCelebrity = faces?[0]
                    
                    if let name = faces?[0].name{
                        self.celebrityName = name
                    }else{
                        print("No recognition Found")
                    }
                    //print("1)\n\nRecognized celeb is: \(self.celebrityName)\n\n")
                }else{
                    print("The error is : \n\n\n" + (error.debugDescription))
                }
                group.leave()
            }
            group.wait()
            group.enter()
            MovieApiManager().getCelebrity(searchQuery: self.celebrityName!, completion: { (celeb, error) in
                if let celeb = celeb{
                    self.recognizedCelebrity = celeb
                }
                group.leave()
            })
            //group.wait()
            //group.enter()
            
            
            group.notify(queue: .main, execute: {
                MovieApiManager().getImage(id: self.recognizedCelebrity!.id, completion: { (url, error) in
                    if let url = url{
                        self.imageUrl = url
                    }
                    // group.leave()
                })
                self.performSegue(withIdentifier: "detailSegue", sender: nil)
            })
            }
            self.dismiss(animated: true, completion: nil)
        }
        present(cameraVC, animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SavedCelebritiesTableViewCell
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CelebrityInfoViewController
        if let celeb = self.recognizedCelebrity{
            dest.recognizedCelebrity = celeb
        }else{
            print("Celeb not found"	)
        }
        dest.imageUrl = self.imageUrl
        
        var movies: [Movie] = []
        for movie in (self.recognizedCelebrity!.knownFor)!{
            if(!(movie is NSNull)){
                let temp = movie as! [String: Any]
                let movie = Movie(dictionary: temp)
                movies.append(movie)
            }
        }
        dest.Movies = movies
    }
    

}
