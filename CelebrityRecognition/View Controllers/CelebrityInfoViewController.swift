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

        // Round Celebrity Picture
        celebPicture.layer.cornerRadius = 0.5 * celebPicture.bounds.size.width
        celebPicture.clipsToBounds = true
        let color = UIColor(red: 255.0/255.0, green: 41.0/255.0, blue: 83.0/255.0, alpha: 1)
        celebPicture.layer.borderColor = color.cgColor
        celebPicture.layer.borderWidth = CGFloat(2.0)
        celebPicture.layer.masksToBounds = true
        
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
        
        celebPicture.af_setImage(withURL: self.imageUrl!)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = Movies[indexPath.item]
            let videoController = segue.destination as! VideoViewController
            videoController.movie = movie
        }
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return Movies.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! PosterCell
        let movie = Movies[indexPath.item]
        
        cell.posterView.af_setImage(withURL: movie.posterUrl!)
        cell.layer.borderWidth = 1.4
        let color = UIColor(red: 255.0/255.0, green: 41.0/255.0, blue: 83.0/255.0, alpha: 1)
        cell.layer.borderColor = color.cgColor
        
        
        return cell
    }

}
