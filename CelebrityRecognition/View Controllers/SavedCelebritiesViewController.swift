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
    
    @IBAction func onCamera(_ sender: Any) {
        //performSegue(withIdentifier: "photoPickerSegue", sender: nil)
        let cameraVC = CameraViewController { (image, asset) in
            
            let recognition = AWSRekognition.default()
            let sourceImage = image
            let image = AWSRekognitionImage()
            image?.bytes = UIImageJPEGRepresentation(sourceImage!, 0.6)
            
            guard let request = AWSRekognitionRecognizeCelebritiesRequest() else {
                puts("Unable to initialize AWSRekognitionDetectLabelsRequest.")
                return
            }
            request.image = image
            recognition.recognizeCelebrities(request) { (response, error) in
                if error == nil{
                    let faces = response?.celebrityFaces
                    for face in faces!{
                        print("Possible name:\(face.name)")
                    }
                }else{
                    print("The error is : \n\n\n" + (error.debugDescription))
                }
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
