//
//  ViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 08/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//
// Access key ID,Secret access key
// AKIAJIRWOGXSKACLGEYA,fy+UGSIlU5IgRaA5Gy6sYW344D/V8V9GERS7vxan

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

