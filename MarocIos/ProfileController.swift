//
//  ProfileController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationController?.title = "Profile"
        authenticateUserAndConfigureView()
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "istockphoto-951659568-1024x1024")
        return iv
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), emailTextField)
    }()
    
    lazy var usernameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_person_outline_white_2x"), usernameTextField)
    }()
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "istockphoto-951659568-1024x1024"), nameTextField)
    }()
    
    lazy var familyNameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-conférence-50"), familyNameTextField)
    }()

    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Username", isSecureTextEntry: false)
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Name", isSecureTextEntry: false)
    }()
    
    lazy var familyNameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Family name", isSecureTextEntry: false)
    }()
    

    
    func loadUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(uid).child("email").observeSingleEvent(of: .value) { (snapshot) in
            guard let email = snapshot.value as? String else { return }
            self.emailTextField.text = "\(email)"
            self.emailTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
            guard let username = snapshot.value as? String else { return }
            self.usernameTextField.text = "\(username)"
            self.usernameTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("users").child(uid).child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else { return }
            self.nameTextField.text = "\(name)"
            self.nameTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("users").child(uid).child("familyName").observeSingleEvent(of: .value) { (snapshot) in
            guard let familyName = snapshot.value as? String else { return }
            self.familyNameTextField.text = "\(familyName)"
            self.familyNameTextField.isUserInteractionEnabled = false
        }
    }
    
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: LoginController())
                navController.navigationBar.barStyle = .black
                self.present(navController, animated: true, completion: nil)
            }
        } else {
            configureViewComponents()
            loadUserData()
        }
    }
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(nameContainerView)
        nameContainerView.anchor(top: usernameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(familyNameContainerView)
        familyNameContainerView.anchor(top: nameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
    }
}
