//
//  FriendsTableViewCell.swift
//  MarocIOS
//
//  Created by Yanis A on 24/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol FriendsTableViewNew {
    func onClickCell(index : Int, idFriend: String)
}

class FriendsTableViewCell: UITableViewCell {
    
    var cellDelegate : FriendsTableViewNew?
    var index : IndexPath?
    var idFriend : String?
    
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
    
    lazy var emaillbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var idFriendlbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Remove", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.red
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
        backView.addSubview(emaillbl)
        backView.addSubview(actionButton)
        
        actionButton.anchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: nil, right: backView.rightAnchor, paddingTop: 75, paddingLeft: 320, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        actionButton.addTarget(self, action: #selector(handleDetailProjects), for: .touchUpInside)
        
    }
    
    @objc func handleDetailProjects() {
        cellDelegate?.onClickCell(index: (index?.row)!,  idFriend: idFriendlbl.text!)
    }
    
}
