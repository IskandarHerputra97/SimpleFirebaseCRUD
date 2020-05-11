//
//  RegisterViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 11/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - PROPERTIES
    let stackView = UIStackView()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let registerButton = UIButton()
    let loginPageButton = UIButton()
    
    let scrollView = UIScrollView()
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        self.title = "Register Page"
        
        setupStackView()
        setupScrollView()
        
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupRegisterButton()
        setupLoginPageButton()
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
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(loginPageButton)
        
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
    }
    
    func setupRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        
        registerButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupLoginPageButton() {
        loginPageButton.setTitle("Already have an account? Login", for: .normal)
        loginPageButton.setTitleColor(.white, for: .normal)
        
        loginPageButton.addTarget(self, action: #selector(loginPageButtonTapped), for: .touchUpInside)
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
        let homeViewController = HomeViewController()
        navigationController?.setViewControllers([homeViewController], animated: true)
    }
    
    @objc func loginPageButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
}
