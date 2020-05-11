//
//  HomeViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 11/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - PROPERTIES
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.title = "Home Page"
        
        setupSignOutButton()
    }
    
    //MARK: - SETUP UI
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.red, for: .normal)
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        setSignOutButtonConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setSignOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func signOutButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
}
