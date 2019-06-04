//
//  ViewController.swift
//  MarocIos
//
//  Created by Yanis A on 14/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        guard let email = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        LogIn(withEmail: email, password: password)
        print("hello ... ")
    }
    
    func LogIn(withEmail email: String, password : String){
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if let error = error {
                print("Fail to login user ...", error.localizedDescription)
            }
            
            print("Login Succesfuly ...")
        }
    }
    
}

