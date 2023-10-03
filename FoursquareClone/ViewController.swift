//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Mahmut Ersoy on 3.10.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // DATA EKLEME
        /*
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Apple"
        parseObject["calories"] = 100
        parseObject.saveInBackground { (success, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("uploaded")
            }
        }
        */
        
        // DATA CEKME
        /*
        let query = PFQuery(className: "Fruits")
        //query.whereKey("name", equalTo: "Apple")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print(objects)
            }
        }
        */
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    print("welcome")
                    print(user?.username)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!!")
                } else {
                    print("OK!")
                }
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

