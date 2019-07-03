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

class AddTaskViewController: UIViewController {
    
    var refProjects:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        refProjects = Database.database().reference().child("tasks")
    }
    
    @objc func addTask(){
        let key = refProjects.childByAutoId().key
        let project = [ "id" : key,
                        "idProject" : "-Lie6B8DuJuZ4o4iM90K",
                        "name" : nameTextField.text! as String,
                        "responsable" : responsableTextField.text! as String,
        ]
        
        refProjects.child(key!).setValue(project)
        navigationController?.popViewController(animated: true)
    }
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-rendre-un-livre-50"),nameTextField)
    }()
    
    lazy var responsableContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_person_outline_white_2x"), responsableTextField)
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Name of the task", isSecureTextEntry: false)
    }()
    
    lazy var responsableTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Responsable of the task", isSecureTextEntry: false)
    }()
    
    
    
    let addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
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
    
    
    @objc func handleShowProjects() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(nameContainerView)
        nameContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 200, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(responsableContainerView)
        responsableContainerView.anchor(top: nameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        
        view.addSubview(addTaskButton)
        addTaskButton.anchor(top: responsableContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 200, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(AbortButton)
        AbortButton.anchor(top: addTaskButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
    }
}

