//
//  SignInViewController.swift
//  MarocIos
//
//  Created by Yanis A on 14/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func SignUp(_ sender: UIButton) {
        guard let name = NameField.text else {return}
        guard let email = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        createUser(withEmail: email, password: password, name: name)
        print("je suis dans signup")
    }
    
    func createUser(withEmail email : String, password : String, name : String ){
        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
            if let error = error {
                print("Fail to sign user ...", error.localizedDescription)
            }
            guard let uid = result?.user.uid else {return}
            
            let values = ["email": email, "name": name]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: {(error, ref) in
                if let error = error {
                    print("Fail to update user ...", error.localizedDescription)
                }
                
                print("succesfuly ... ")
            })
        }
    }
}
