//
//  LoginViewController.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 07/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var userNameString:String?
    var passwordString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func signInBtn(_ sender: Any) {
        print("SignInBtn Pressed")
        userNameString = userNameField.text
        passwordString = passwordField.text
        
        if (userNameString?.isEmpty)! || (passwordString?.isEmpty)! {
            
            ShowAlert(title: "Alert", message: "Either username or password is empty", controller: self)
        self.userNameField.becomeFirstResponder()
        } else {
            
        }
        
        callLoginWebAPI()
    }
    //MARK:- Call Login Web API
    func callLoginWebAPI() {
        guard self.isValidate() else {
            return
        }

        self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.3))
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        print("Device ID=\(deviceID)")
        
         let parameters = ["userid": userNameField.text!, "password": passwordField.text!] as [String: String]
        let headers = ["Content-Type" :"application/json","Accept":"application/json"]
    
        APIManager.shared.loginPostRequest(parameters, header: headers) { (response, error) in
            
            if response != nil {
                
                print("RResponse:",response)
            } else {
                
                print(error)
            }
        }
    }
    
    func isValidate () -> Bool  {
        guard !(self.userNameField.text?.isEmpty)! else {
            
            ShowAlert(title: "Alert", message: "Please enter UserName", controller: self)
          return false
        }
        guard !(self.passwordField.text?.isEmpty)! else {
              ShowAlert(title: "Alert", message: "Please enter password", controller: self)
            return false
        }
 
              return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            textField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        if textField == passwordField {
            userNameString = userNameField.text
            passwordString = passwordField.text
            if (userNameString?.isEmpty)! || (passwordString?.isEmpty)! {
                textField.resignFirstResponder()
                userNameField.becomeFirstResponder()
            } else {
                print("ok")
            }
        }
        
      return true
    }

}


















