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
    var image = UIImage(named: "LoginBGImage")
    
    @IBAction func onCamera(_ sender: Any) {
        var imageSelected = false
        let cameraVC = CameraViewController { (image, asset) in
            
            if let sourceImage = image{
                let image = AWSRekognitionImage()
                image?.bytes = UIImageJPEGRepresentation(sourceImage, 0.6)
                self.takenPicture = sourceImage
                guard let request = AWSRekognitionRecognizeCelebritiesRequest() else {
                    puts("Unable to initialize AWSRekognitionDetectLabelsRequest.")
                    return
                }
                request.image = image
                
                self.recognition.recognizeCelebrities(request) { (response, error) in
                    if error == nil{
                        let faces = response?.celebrityFaces
                        self.faces = faces!
                        imageSelected = true
                        self.currentCelebrity = faces?[0]
                        for face in faces!{
                            print("Possible name:\(face.name)")
                        }
                    }else{
                        print("The error is : \n\n\n" + (error.debugDescription))
                    }
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
        present(cameraVC, animated: true, completion: nil)
        
        if(imageSelected){
            imageSelected = false
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }
        
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dest = segue.destination as! CelebrityInfoViewController
        dest.celebrity = self.currentCelebrity
        dest.celebPicture.image = self.takenPicture
    }
    

}
