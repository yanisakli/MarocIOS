//
//  CustomTableViewCell.swift
//  MarocIOS
//
//  Created by Yanis A on 02/07/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

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
        let lbl = UILabel(frame: CGRect(x: 300, y: 50, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
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
    }

}
