//
//  LoginViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 16/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the bottom border for email and password text fields
        let emailBorder = CALayer()
        let passwordBorder = CALayer()
        let width = CGFloat(2.0)
        emailBorder.borderColor = UIColor.white.cgColor
        passwordBorder.borderColor = UIColor.white.cgColor
        emailBorder.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width, width:  emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        passwordBorder.frame = CGRect(x: 0, y: passwordTextField.frame.size.height - width, width:  passwordTextField.frame.size.width, height: passwordTextField.frame.size.height)
        
        emailBorder.borderWidth = width
        passwordBorder.borderWidth = width
        emailTextField.layer.addSublayer(emailBorder)
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.addSublayer(passwordBorder)
        passwordTextField.layer.masksToBounds = true
        
        // Changing the entered and placeholder text color so it actually shows against the dark background
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        emailTextField.textColor = UIColor.white
        passwordTextField.textColor = UIColor.white

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "LoginBGImage")!)

        
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
