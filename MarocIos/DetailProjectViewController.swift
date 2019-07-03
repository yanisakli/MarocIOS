//
//  DetailProjectViewController.swift
//  MarocIOS
//
//  Created by Yanis A on 03/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class DetailProjectViewController: UIViewController {

    var idProject : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        loadUserData()
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "projectPic")
        return iv
    }()
    
    lazy var subjectContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-rendre-un-livre-50"), subjectTextField)
    }()
    
    lazy var teamNameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-conférence-50"), teamNameTextField)
    }()
    
    lazy var dateContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-calendrier-12-50"), dateTextField)
    }()
    
    lazy var informationContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-information-50"), informationTextField)
    }()
    
    lazy var prvContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_lock_outline_white_2x"), prvTextField)
    }()
    
    
    lazy var subjectTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Subject", isSecureTextEntry: false)
    }()
    
    lazy var teamNameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Team name", isSecureTextEntry: false)
    }()
    
    lazy var dateTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Date", isSecureTextEntry: false)
    }()
    
    lazy var informationTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Information", isSecureTextEntry: false)
    }()
    
    lazy var prvTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Private", isSecureTextEntry: false)
    }()
    
    let showTasksProjectButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Show tasks", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleShowProjects), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    let AbortButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Abort", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleShowProjects), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    func loadUserData() {
    
        Database.database().reference().child("projects").child(idProject!).child("subject").observeSingleEvent(of: .value) { (snapshot) in
            
                guard let subject = snapshot.value as? String else { return }
                self.subjectTextField.text = "\(subject)"
                self.subjectTextField.isUserInteractionEnabled = false
            }
        
        Database.database().reference().child("projects").child(idProject!).child("information").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let information = snapshot.value as? String else { return }
            self.informationTextField.text = "\(information)"
            self.informationTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("projects").child(idProject!).child("date").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let date = snapshot.value as? String else { return }
            self.dateTextField.text = "\(date)"
            self.dateTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("projects").child(idProject!).child("teamName").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let teamName = snapshot.value as? String else { return }
            self.teamNameTextField.text = "\(teamName)"
            self.teamNameTextField.isUserInteractionEnabled = false
        }
        
        Database.database().reference().child("projects").child(idProject!).child("isPrivate").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let isPrivate = snapshot.value as? String else { return }
            self.prvTextField.text = "\(isPrivate)" == "true" ? "Private project" : "Public project"
            self.prvTextField.isUserInteractionEnabled = false
        }
    }
    
    
    
    @objc func handleShowProjects() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 250)
        
        view.addSubview(subjectContainerView)
        subjectContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(teamNameContainerView)
        teamNameContainerView.anchor(top: subjectContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dateContainerView)
        dateContainerView.anchor(top: teamNameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(informationContainerView)
        informationContainerView.anchor(top: dateContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(prvContainerView)
        prvContainerView.anchor(top: informationContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(showTasksProjectButton)
        showTasksProjectButton.anchor(top: prvContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(AbortButton)
        AbortButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
    }

}
