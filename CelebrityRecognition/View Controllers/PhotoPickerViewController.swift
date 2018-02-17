//
//  ViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 08/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//
// User name,Password,Access key ID,Secret access key,Console login link
// shauryasinha,,AKIAIGTQYQEP7LOVPPUQ,0qG/CjJ8G20smxLZdis29n2m6yu/OE19iRd2xAJa,https://873417833031.signin.aws.amazon.com/console

import UIKit
import AWSRekognition
import ALCameraViewController

class PhotoPickerViewController: UIViewController {
    
    let cameraVC = CameraViewController { (image, asset) in
        
        
    }
    @IBAction func testButton(_ sender: Any) {
        print("button pressed")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

