//
//  ProjectsController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class ProjectsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    let addProjectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add project", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handleAddProject), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    @objc func handleAddProject() {
        navigationController?.pushViewController(AddProjectController(), animated: true)
    }
    
    // MARK: - API
    
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        navigationController?.title = "Projects"
        
        view.addSubview(addProjectButton)
        addProjectButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
    }

}
