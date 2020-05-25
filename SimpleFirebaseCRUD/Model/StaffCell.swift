//
//  StaffCell.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffCell: UITableViewCell {

    var staffImageView = UIImageView()
    var staffNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(staffImageView)
        addSubview(staffNameLabel)
        
        setupStaffImageView()
        setupStaffNameLabel()
        setStaffImageViewConstraints()
        setStaffNameLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(staff: Staff) {
        //staffImageView.image = staff.image
        staffNameLabel.text = staff.name
    }
    
    func setupStaffImageView() {
        staffImageView.layer.cornerRadius = 10
        staffImageView.clipsToBounds = true
    }
    
    func setupStaffNameLabel() {
        staffNameLabel.numberOfLines = 0
        staffNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setStaffImageViewConstraints() {
        staffImageView.translatesAutoresizingMaskIntoConstraints = false
        staffImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        staffImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        staffImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        staffImageView.widthAnchor.constraint(equalTo: staffImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setStaffNameLabelConstraints() {
        staffNameLabel.translatesAutoresizingMaskIntoConstraints = false
        staffNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        staffNameLabel.leadingAnchor.constraint(equalTo: staffImageView.trailingAnchor, constant: 20).isActive = true
        staffNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        staffNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
