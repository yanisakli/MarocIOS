//
//  ShowTasksViewController.swift
//  MarocIOS
//
//  Created by Yanis A on 03/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit
import Firebase

class TaskModal {
    var name: String?
    var responsable: String?
    var id: String?
    
    init( name: String, responsable: String, id: String) {
        self.name = name
        self.responsable = responsable
        self.id = id
    }
}
class ShowTasksViewController: UIViewController {
    
    var tableView = UITableView()
    var userArr = [TaskModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        setTableView()
        
        let refTasks = Database.database().reference().child("tasks")
        refTasks.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.userArr.removeAll()
                
                for tasks in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let taskObject = tasks.value as? [String: String]
                    let taskName = taskObject?["name"]
                    let taskResponsable = taskObject?["responsable"]
                    let taskId = taskObject?["id"]
                    
                    let task = TaskModal(name: (taskName )!, responsable: (taskResponsable )!, id: (taskId )!);
                    self.userArr.append(task)
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
        
        self.view.addSubview(addTaskButton)
        addTaskButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 170, paddingRight: 32, width: 0, height: 50)
        
        self.view.addSubview(backButton)
        backButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 100, paddingRight: 32, width: 0, height: 50)
        
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "CellTask")
    }
    
    
    
    
    
    let addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handleAddTask), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    @objc func handleAddTask() {
        navigationController?.pushViewController(AddTaskViewController(), animated: true)
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func configureViewComponents() {
        view.backgroundColor = UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0)
        navigationController?.navigationBar.isHidden = true
    }
    
}


extension ShowTasksViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTask", for: indexPath) as? TaskTableViewCell else {fatalError("Unabel to create cell")}
        cell.namelbl.text = userArr[indexPath.row].name
        cell.responsablelbl.text = userArr[indexPath.row].responsable
        cell.idTasklbl.text = userArr[indexPath.row].id
        
        cell.cellDelegate = self
        cell.index = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ShowTasksViewController : TaskTableViewNew {
    func onClickCell(index : Int, idTask : String){
        Database.database().reference().child("tasks").child("\(idTask)").removeValue()
    }
    
}
