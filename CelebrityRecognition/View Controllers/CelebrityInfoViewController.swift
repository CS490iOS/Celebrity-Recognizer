//
//  CelebrityInfoViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 17/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import AWSRekognition
import UIKit
import AlamofireImage

class CelebrityInfoViewController: UIViewController, UICollectionViewDataSource {
    
    var celebrity = AWSRekognitionCelebrity()
    var Movies: [Movie] = []

    @IBOutlet weak var celebPicture: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // Celebrity Properties
    var recognizedCelebrity : Celebrity?
    var imageUrl: URL?
    
    //Movie Poster Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Button
        let tint = UIColor(displayP3Red: 254, green: 46, blue: 137, alpha: 1)
        cancelButton.tintColor = tint
        
        // Collection View Stuff
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        
        // Celebrity Stuff
        if let celeb = recognizedCelebrity{
            nameLabel.text = celeb.name
        }else{
            nameLabel.text = "Loogabarooga"
        }
        
        
        var knownForText = "You've seen them in: "
        
        print(recognizedCelebrity!.knownFor)
        for movie in (recognizedCelebrity!.knownFor)!{
            if(!(movie is NSNull)){
                let temp = movie as! [String: Any]
                knownForText += temp["original_title"] as! String + "\n"
            }
            
        }
        
        urlLabel.text = knownForText
        
        celebPicture.af_setImage(withURL: self.imageUrl!)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return Movies.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! PosterCell
        let movie = Movies[indexPath.item]
        
        cell.posterView.af_setImage(withURL: movie.posterUrl!)
        cell.layer.borderWidth = 1.4
        cell.layer.borderColor = UIColor.red.cgColor
        
        
        return cell
    }

}
