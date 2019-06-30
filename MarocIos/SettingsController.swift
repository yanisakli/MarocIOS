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
        
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "Settings"
    }
}
