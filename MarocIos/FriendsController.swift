//
//  FriendsController.swift
//  MarocIOS
//
//  Created by Yanis A on 24/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class FriendModal {
    var name: String?
    var email: String?
    var id: String?
    
    init( name: String, email: String, id: String) {
        self.name = name
        self.email = email
        self.id = id
    }
}

class FriendsController: UIViewController {

    var tableView = UITableView()
    var userArr = [FriendModal]()
    var idProject : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        setTableView()
        
        let refTasks = Database.database().reference().child("friends")
        refTasks.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.userArr.removeAll()
                
                for friends in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let friendObject = friends.value as? [String: String]
                    let friendName = friendObject?["nameUser"]
                    let friendEmail = friendObject?["emailUser"]
                    let friendId = friends.key
                    
                    let friend = FriendModal(name: (friendName )!, email: (friendEmail )!, id: friendId );
                    self.userArr.append(friend)
                }
                self.tableView.reloadData()
            }
            
        })
    }

    
    
    
    
    let ShowUsersToAddButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Users", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleShowUsers), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    let AbortButton: UIButton = {
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Back", for: .normal)
        buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonOne.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        buttonOne.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        buttonOne.addTarget(self, action: #selector(handleShowSettings), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 10
        return buttonOne
    }()
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        self.view.addSubview(tableView)
        
        self.view.addSubview(ShowUsersToAddButton)
        ShowUsersToAddButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 170, paddingRight: 32, width: 0, height: 50)
        
        self.view.addSubview(AbortButton)
        AbortButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "CellFriends")
    }
    
    @objc func handleShowSettings() {
        navigationController?.popViewController(animated: true)
    }
    @objc func handleShowUsers() {
        navigationController?.pushViewController(UsersViewController(), animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension FriendsController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellFriends", for: indexPath) as? FriendsTableViewCell else {fatalError("Unabel to create cell")}
        cell.namelbl.text = userArr[indexPath.row].name
        cell.emaillbl.text = userArr[indexPath.row].email
        cell.idFriendlbl.text = userArr[indexPath.row].id
        
        cell.cellDelegate = self
        cell.index = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension FriendsController : FriendsTableViewNew {
    func onClickCell(index : Int, idFriend : String){
        Database.database().reference().child("friends").child("\(idFriend)").removeValue()
    }
    
}

