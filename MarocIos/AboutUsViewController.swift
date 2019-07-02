//
//  AboutUsViewController.swift
//  MarocIOS
//
//  Created by Yanis A on 02/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    lazy var AboutUsTitle: UILabel = {
        let tf = UILabel()
        tf.text = "ProjecZ"
        tf.textColor = .white
        tf.numberOfLines = 0
        tf.font = UIFont.boldSystemFont(ofSize: 30.0)
        return tf
    }()
    
    lazy var aboutUsOne: UILabel = {
        let tf = UILabel()
        tf.text = "When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. \n\n\n• Step 1: You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.\n\n• Step 2: Our Privacy Policy describes how we handle the information you provide to us when you use our Services."
        tf.textColor = .white
        tf.numberOfLines = 0
        return tf
    }()
    
    
    let AbortButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Back", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(AboutUsTitle)
        AboutUsTitle.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 150, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        view.addSubview(aboutUsOne)
        aboutUsOne.anchor(top: AboutUsTitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        view.addSubview(AbortButton)
        AbortButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
    }
    

}
