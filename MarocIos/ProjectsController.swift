//
//  ProjectsController.swift
//  MarocIOS
//
//  Created by Yanis A on 30/06/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class ProjectModal {
    var subject: String?
    var prv: String?
    
    init( subject: String, prv: String) {
        self.subject = subject
        self.prv = prv
    }
}
class ProjectsController: UIViewController {

    var tableView = UITableView()
    var userArr = [ProjectModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        setTableView()
        
        let refProjects = Database.database().reference().child("projects")
        refProjects.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.userArr.removeAll()
                
                for projects in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let projectObject = projects.value as? [String: String]
                    let projectSubject = projectObject?["subject"]
                    let projectPrv = projectObject?["isPrivate"]
                    
                    let prive =  (projectPrv )! == "true" ? "privé" : "public"
                    let project = ProjectModal(subject: (projectSubject )!, prv: prive);
                    self.userArr.append(project)
                }
                self.tableView.reloadData()
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        self.view.addSubview(tableView)
        
        self.view.addSubview(addProjectButton)
        addProjectButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
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
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.title = "Projects"
        navigationController?.navigationBar.isHidden = true
    }
    
    func handleDetailProject() {
        navigationController?.pushViewController(AddProjectController(), animated: true)
    }

}


extension ProjectsController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError("Unabel to create cell")}
        cell.namelbl.text = userArr[indexPath.row].subject
        cell.prvlbl.text = userArr[indexPath.row].prv
        
        cell.cellDelegate = self
        cell.index = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ProjectsController : TableViewNew{
    func onClickCell(index : Int, idProject : String){
       print(idProject)
        navigationController?.pushViewController(AddProjectController(), animated: true)
    }
    
}
