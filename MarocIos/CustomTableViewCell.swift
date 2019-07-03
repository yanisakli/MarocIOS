//
//  CustomTableViewCell.swift
//  MarocIOS
//
//  Created by Yanis A on 02/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index : Int, idProject: String)
}
class CustomTableViewCell: UITableViewCell {

    var cellDelegate : TableViewNew?
    var index : IndexPath?
    var idProject : String?
    
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
    
    lazy var prvlbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var idProjectlbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Details", for: .normal)
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
        backView.addSubview(prvlbl)
        backView.addSubview(actionButton)
        
        actionButton.anchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: nil, right: backView.rightAnchor, paddingTop: 70, paddingLeft: 310, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        actionButton.addTarget(self, action: #selector(handleDetailProjects), for: .touchUpInside)

    }
    
    @objc func handleDetailProjects() {
        cellDelegate?.onClickCell(index: (index?.row)!,  idProject: idProjectlbl.text!)
    }


}
