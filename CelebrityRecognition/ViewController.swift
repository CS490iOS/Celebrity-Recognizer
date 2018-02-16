//
//  ViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 08/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import AWSRekognition

class ViewController: UIViewController {

    let recognition = AWSRekognition.default()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

