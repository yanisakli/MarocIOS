//
//  AddProjectController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddProjectController: UIViewController {
    
    var refProjects:DatabaseReference!
    var isPrivate = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        refProjects = Database.database().reference().child("projects")
    }
    @objc func addProject(){
        let key = refProjects.childByAutoId().key
        let project = [ "id" : key,
                       "information" : informationTextField.text! as String,
                       "date" : dateTextField.text! as String,
                       "teamName" : teamNameTextField.text! as String,
                       "subject" : subjectTextField.text! as String,
                       "isPrivate" : isPrivate ? "true" : "false"
                        ]
        
        refProjects.child(key!).setValue(project)
        navigationController?.popViewController(animated: true)
    }

    lazy var informationContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-information-50"), informationTextField)
    }()
    
    lazy var dateContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-calendrier-12-50.png"), dateTextField)
    }()
    
    lazy var teamNameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-conférence-50"), teamNameTextField)
    }()
    
    lazy var subjectContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-rendre-un-livre-50"), subjectTextField)
    }()
    
    lazy var informationTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Information", isSecureTextEntry: false)
    }()
    
    lazy var dateTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Date", isSecureTextEntry: false)
    }()
    
    lazy var teamNameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Team name", isSecureTextEntry: false)
    }()
    
    lazy var subjectTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Subject", isSecureTextEntry: false)
    }()
    
    lazy var privateProjectLabel: UILabel = {
        let tf = UILabel()
        tf.text = "Private project ?"
        tf.textColor = .white
        return tf
    }()
    
    let switchButton: UISwitch = {
        let myswitch = UISwitch()
        myswitch.isOn = false
        myswitch.thumbTintColor = UIColor.black
        myswitch.tintColor = UIColor.green
        myswitch.onTintColor = UIColor.cyan
        myswitch.addTarget(self, action: #selector(switchInAction(sender:)), for: UIControl.Event.valueChanged)
        return myswitch
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(addProject), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let AbortButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Back", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleShowProjects), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    @objc func switchInAction(sender : UISwitch) {
        if(sender.isOn){
            isPrivate = true
        }
        else{
            isPrivate = false
        }
    }
    
    @objc func handleShowProjects() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(informationContainerView)
        informationContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 200, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dateContainerView)
        dateContainerView.anchor(top: informationContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(teamNameContainerView)
        teamNameContainerView.anchor(top: dateContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(subjectContainerView)
        subjectContainerView.anchor(top: teamNameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(privateProjectLabel)
        privateProjectLabel.anchor(top: subjectContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 40, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(switchButton)
        switchButton.anchor(top: subjectContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 330, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: switchButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
    
        view.addSubview(AbortButton)
        AbortButton.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
    }
}
