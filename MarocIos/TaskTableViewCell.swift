//
//  TaskTableViewCell.swift
//  MarocIOS
//
//  Created by Yanis A on 03/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol TaskTableViewNew {
    func onClickCell(index : Int, idTask: String)
}
class TaskTableViewCell: UITableViewCell {
    
    var cellDelegate : TaskTableViewNew?
    var index : IndexPath?
    var idTask : String?
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        view.backgroundColor = UIColor(red:0.40, green:0.37, blue:1.00, alpha:1.0)
        
        return view
    }()
    
    lazy var namelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 10, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var responsablelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var idTasklbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 260, y: 50, width: 100, height: 30))
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:0.16, green:0.18, blue:0.26, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor.cyan
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(namelbl)
        backView.addSubview(responsablelbl)
        backView.addSubview(actionButton)
        
        actionButton.addTarget(self, action: #selector(handleDetailProjects), for: .touchUpInside)
        
    }
    
    @objc func handleDetailProjects() {
        cellDelegate?.onClickCell(index: (index?.row)!,  idTask: idTasklbl.text!)
    }
    
    
}
