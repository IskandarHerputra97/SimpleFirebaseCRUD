//
//  StaffCollectionListViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 20/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffCollectionListViewController: UIViewController {

    //MARK: - PROPERTIES
    
    let testText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        title = "Staff Collection View"
        
        setupTestText()
    }
    
    //MARK: - SETUP UI
    func setupTestText() {
        view.addSubview(testText)
        
        testText.text = "Collection view page"
        
        setTestTextConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setTestTextConstraints() {
        testText.translatesAutoresizingMaskIntoConstraints = false
        //testText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //testText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //testText.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -300).isActive = true
    }
}
