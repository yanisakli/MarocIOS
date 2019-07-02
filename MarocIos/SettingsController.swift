//
//  SettingsController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()

    }
    
    let privacyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Privacy", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handlePressPrivacy), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let aboutUsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("About us", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handlePressAboutUS), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    @objc func handlePressPrivacy() {
        navigationController?.pushViewController(PrivacyViewController(), animated: true)
    }
    
    @objc func handlePressAboutUS() {
        navigationController?.pushViewController(AboutUsViewController(), animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.title = "Settings"
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(privacyButton)
        privacyButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 300, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(aboutUsButton)
        aboutUsButton.anchor(top: privacyButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
    }
}
