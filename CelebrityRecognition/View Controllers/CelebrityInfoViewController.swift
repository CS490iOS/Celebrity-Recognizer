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

class CelebrityInfoViewController: UIViewController {
    
    var celebrity = AWSRekognitionCelebrity()

    @IBOutlet weak var celebPicture: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var recognizedCelebrity : Celebrity?
    var imageUrl: URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let celeb = recognizedCelebrity{
            nameLabel.text = celeb.name
        }else{
            nameLabel.text = "Loogabarooga"
        }
        
        
        var knownForText = "You've seen them in: "
        
        print(recognizedCelebrity!.knownFor)
        for movie in (recognizedCelebrity!.knownFor)!{
            if(movie != nil){
                let temp = movie as! [String: Any]
                knownForText += temp["original_title"] as! String + "\n"
            }
            
        }
        
        urlLabel.text = knownForText
        
        celebPicture.af_setImage(withURL: self.imageUrl!)
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
