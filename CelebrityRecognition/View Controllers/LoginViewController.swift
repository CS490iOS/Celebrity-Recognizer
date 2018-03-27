//
//  LoginViewController.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 16/02/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import AWSMobileClient
import AWSCore
import Firebase


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBAction func onLogin(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user,error) in
            if((error) != nil){
                if error?._code == AuthErrorCode.wrongPassword.rawValue{
                    self.errorHandling(typeOfError: "Wrong password")
                }
                else if  error?._code == AuthErrorCode.userNotFound.rawValue{
                    self.errorHandling(typeOfError: "User does not exist")
                }
                else if  error?._code == AuthErrorCode.invalidEmail.rawValue{
                    self.errorHandling(typeOfError: "Invalid email")
                }
               
                
            }else{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
            
        }
       
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user,error) in
            if((error) != nil){
                if error?._code == AuthErrorCode.emailAlreadyInUse.rawValue{
                    self.errorHandling(typeOfError: "Email already exists")
                }
                else if  error?._code == AuthErrorCode.weakPassword.rawValue{
                     self.errorHandling(typeOfError: "Password is weak")
                }
                else if  error?._code == AuthErrorCode.invalidEmail.rawValue{
                    self.errorHandling(typeOfError: "Invalid email")
                }
                
            }else{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
            
        }
       
        
    }
    func errorHandling(typeOfError: String){
        
        let alertController = UIAlertController(title: "Error", message: typeOfError, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
        // Do any additional setup after loading the view.
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // User Persistence
        let user = Auth.auth().currentUser
        
        print(user?.email)
        
        if user != nil{
            self.performSegue(withIdentifier: "loginSegue"){
            }
        }else{
            print("No user logged in")
        }
        
    }
    
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
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        return true;
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
