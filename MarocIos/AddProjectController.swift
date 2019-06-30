//
//  AddProjectController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class AddProjectController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
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
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handleCreateProject), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
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
    
    @objc func handleCreateProject() {
//        guard let information = informationTextField.text else { return }
//        guard let teamName = teamNameTextField.text else { return }
//        guard let date = dateTextField.text else { return }
//        guard let subject = subjectTextField.text else { return }
        
        createProject()
    }
    
    @objc func handleShowProjects() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - API
    
    func createProject() {
    }
    
    // MARK: - Helper Functions
    
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
        
        view.addSubview(loginButton)
        loginButton.anchor(top: privateProjectLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
    
        view.addSubview(AbortButton)
        AbortButton.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
    }
}
