//
//  HomeController.swift
//  CreateFirebaseUser
//
//  Created by Stephen Dowless on 1/2/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UITabBarController {
    
    // MARK: - Properties
    func setUpTabBar() {
        
        let projectController = UINavigationController(rootViewController: ProjectsController())
        projectController.tabBarItem.image = UIImage(named: "project")
        projectController.tabBarItem.selectedImage = UIImage(named: "project")
        
        let settingController = UINavigationController(rootViewController: SettingsController())
        settingController.tabBarItem.image = UIImage(named: "settings")
        settingController.tabBarItem.selectedImage = UIImage(named: "settings")
        
        let profileController = UINavigationController(rootViewController: ProfileController())
        profileController.tabBarItem.image = UIImage(named: "profile")
        profileController.tabBarItem.selectedImage = UIImage(named: "profile")
        
        viewControllers=[projectController , settingController, profileController]
        
        
        guard let items = tabBar.items else {return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: -4, left: 0, bottom: -4, right: 0)
        }
    }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        authenticateUserAndConfigureView()
        setUpTabBar()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignOut() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - API
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let navController = UINavigationController(rootViewController: LoginController())
            navController.navigationBar.barStyle = .black
            self.present(navController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error..", error)
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
        }
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        
        navigationItem.title = "ProjecZ"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), style: .plain, target: self, action: #selector(handleSignOut))
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
    }
    
}
