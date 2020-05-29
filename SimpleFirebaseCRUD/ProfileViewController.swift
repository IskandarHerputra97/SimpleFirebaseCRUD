//
//  ProfileViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 17/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class ProfileViewController: UIViewController {

    //MARK: - Properties
    let profileLabel = UILabel()
    let randomNameLabel = UILabel()
    let signOutButton = UIButton()
    var handle: AuthStateDidChangeListenerHandle?
    
    let textView = UITextView()
    let fetchButton = UIButton()
    
    let networkingClient = NetworkingClient()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .orange
        setupProfileLabel()
        setupRandomNameLabel()
        setupFetchButton()
        setupSignOutButton()
        
        //setupTextView()
        
        
        setupStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("auth = \(auth)")
            if let user = user {
                print("user = \(user)")
                self.profileLabel.text = user.email
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    //MARK: - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        
        stackView.addArrangedSubview(profileLabel)
        stackView.addArrangedSubview(randomNameLabel)
        stackView.addArrangedSubview(fetchButton)
        stackView.addArrangedSubview(signOutButton)
        //stackView.addArrangedSubview(textView)
        
        
        setStackViewConstraints()
    }
    
    func setupProfileLabel() {
        //view.addSubview(profileLabel)
        
        profileLabel.text = "user@gmail.com"
        profileLabel.numberOfLines = 0
        
        //setProfileLabelConstraints()
    }
    
    func setupRandomNameLabel() {
        randomNameLabel.text = "Press Fetch button to get a random name"
    }
    
    func setupSignOutButton() {
        //view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.red, for: .normal)
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        //setSignOutButtonConstraints()
    }
    
    func setupTextView() {
        view.addSubview(textView)
        
        //setTextViewConstraints()
    }
    
    func setupFetchButton() {
        view.addSubview(fetchButton)
        
        fetchButton.setTitle("Fetch", for: .normal)
        
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped(_:)), for: .touchUpInside)
        
        //setFetchButtonConstraints()
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
    
    func setTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: signOutButton.bottomAnchor, constant: 20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setFetchButtonConstraints() {
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func signOutButtonTapped() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            print("sign out")
            
            let loginViewController = LoginViewController()
            let navigationController1 = UINavigationController(rootViewController: loginViewController)
            
            self.tabBarController?.navigationController?.pushViewController(navigationController1, animated: true)
            self.tabBarController?.show(navigationController1, sender: self)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @objc func fetchButtonTapped(_ sender: UIButton!) {
        print("fetch button tapped from profile")
        
        //self.randomNameLabel.text = "Changed"
        //textView.text = "Changed now"
        
        //guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
        guard let urlToExecute = URL(string: "https://api.namefake.com") else {
            return
        }
        /*
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                //self.textView.text = json.description
                //self.profileLabel.text = json.description
                //self.randomNameLabel.text = json.description
                
            }
        }
        */
         //networkingClient.fetchDataWithAlamofire()
        /*
        Alamofire.request("https://api.namefake.com", method: .get).responseJSON { (response) in
            //check if result has value
            if let JSON = response.result.value as? [String: Any] {
                print(JSON["name"] as! String)
                self.randomNameLabel.text = JSON["name"] as? String
            }
        }
        */
        
        
//        networkingClient.fetchDataWithAlamofire { (result) in
//            self.randomNameLabel.text = result
//        }
 
        //self.randomNameLabel.text = "Data"
        networkingClient.fetchDataWithAlamofire { (result) in
            self.randomNameLabel.text = result
        }
    }
}
