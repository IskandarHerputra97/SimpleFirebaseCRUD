//
//  LoginViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 09/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    //MARK: - PROPERTIES
    let stackView = UIStackView()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let registerPageButton = UIButton()
    
    let scrollView = UIScrollView()
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        self.title = "Login Page"
        
        setupStackView()
        setupScrollView()
        
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupLoginButton()
        setupRegisterPageButton()
    }

    //MARK: - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerPageButton)
        
        setStackViewConstraints()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.frame = .zero
        scrollView.frame = view.bounds
        scrollView.contentSize = contentViewSize
        
        scrollView.addSubview(stackView)
        
        setScrollViewConstraints()
    }
    
    func setupEmailLabel() {
        emailLabel.text = "Email"
        emailLabel.textAlignment = .center
    }
    
    func setupEmailTextField() {
        emailTextField.borderStyle = .line
        emailTextField.backgroundColor = .white
    }
    
    func setupPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .center
    }
    
    func setupPasswordTextField() {
        passwordTextField.borderStyle = .line
        passwordTextField.backgroundColor = .white
        passwordTextField.isSecureTextEntry = true
    }
    
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupRegisterPageButton() {
        registerPageButton.setTitle("Don't have an account? Register now", for: .normal)
        registerPageButton.setTitleColor(.white, for: .normal)
        
        registerPageButton.addTarget(self, action: #selector(registerPageButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35).isActive = true
    }
    
    func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func loginButtonTapped(sender: UIButton!) {
        email = emailTextField.text
        password = passwordTextField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            } else if let user = user {
                print("user = \(user)")
                let homeViewController = HomeViewController()
                self.navigationController?.present(homeViewController, animated: true, completion: nil)
            }
        }
    }
 
    @objc func registerPageButtonTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.setViewControllers([registerViewController], animated: true)
    }
}

