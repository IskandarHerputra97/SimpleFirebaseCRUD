//
//  ProfileViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 17/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    let profileLabel = UILabel()
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .orange
        setupProfileLabel()
        setupSignOutButton()
    }
    
    //MARK: - SETUP UI
    func setupProfileLabel() {
        view.addSubview(profileLabel)
        
        profileLabel.text = "user@gmail.com"
        
        setProfileLabelConstraints()
    }
    
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.red, for: .normal)
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        setSignOutButtonConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setProfileLabelConstraints() {
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setSignOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20).isActive = true
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func signOutButtonTapped() {
        print("sign out")
        let loginViewController = LoginViewController()
        let navigationController1 = UINavigationController(rootViewController: loginViewController)
        
        self.tabBarController?.navigationController?.pushViewController(navigationController1, animated: true)
        self.tabBarController?.show(navigationController1, sender: self)
    }
}
